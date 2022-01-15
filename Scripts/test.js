const main = async () => {
  
    let card;
    card = await cardfactory.createCard("test", 4, 5, 6);

};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error); 
        process.exit(1); 
    }
};

runMain();