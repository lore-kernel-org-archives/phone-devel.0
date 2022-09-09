Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CBAECAAA1
	for <phone-devel@archiver.kernel.org>; Fri,  9 Sep 2022 08:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiIIIdd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Sep 2022 04:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiIIId3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Sep 2022 04:33:29 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A044A129C70;
        Fri,  9 Sep 2022 01:33:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id E708ADFAF7;
        Fri,  9 Sep 2022 01:32:54 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id D_vdKZBvcM2E; Fri,  9 Sep 2022 01:32:54 -0700 (PDT)
Message-ID: <01c155150429aac94123199333422cdd4759c060.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1662712373; bh=lmb/EpxzqNtBA17OoOMPewr6KWHKEYpB3HnERroAK9s=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=WesvIlzY0wDqEoD4Ml8bJFMdfWcRSXVZE9MChUNQ18Ua6HKy1Mbheh/O7noXdMoJm
         pLoWKSyLoaUgTU39MHQn7XJxw8aUJwMAZafg28sAqAER7Gf7B2B2bcXLNovQayl3LG
         KC96lwUP46MDfTBE/RV7dL0wJOVj8IWpXXUj5y++pVhAL8ezZzHEOsaPWGLtOZBi0t
         00Mgg0n3Z2o6UGi6Hot4zsFdMzNj7DGuLhAjcscBefQjCl5dc6tHaXUgTtWjpXE6AS
         lvL/K4vdiOEgrlXg0EMdjGCJY9im8JsTLiFEYN2gM6JfsRfC/vqkJLIwMBuOR2mx4u
         owu6rKDjnKjGQ==
Subject: Re: [PATCH v2 2/6] arm64: dts: imx8mq-librem5: add RGB pwm
 notification leds
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     festevam@gmail.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org,
        Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Date:   Fri, 09 Sep 2022 10:32:49 +0200
In-Reply-To: <20220906084531.GA29911@duo.ucw.cz>
References: <20220902084216.1259202-1-martin.kepplinger@puri.sm>
         <20220902084216.1259202-3-martin.kepplinger@puri.sm>
         <20220906084531.GA29911@duo.ucw.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Am Dienstag, dem 06.09.2022 um 10:45 +0200 schrieb Pavel Machek:
> Hi!
> 
> > From: Guido Günther <agx@sigxcpu.org>
> > 
> > Describe the RGB notification leds on the Librem 5 phone.
> > Use the common defines so we're sure to adhere to the common
> > patterns,
> > use predefined led colors and functions so we're being warned in
> > case
> > of deprecations.
> 
> I'd like LED lists to be cc-ed on patches like this, so that we can
> keep userland API consistent.
> 
> In particular, RGB LED is very common feature on the phones, and it
> would be good to have it consistent accross them. Can you take a look
> at Documentation/leds/well-known-leds.txt, decide if your current API
> is suitable, and update the file so that we get the consistency?
> 
> Thanks,
>                                                                 Pavel

thanks for the feedback Pavel, thanks for queueing up Shawn,

that indeed says that phones should use the multicolor descriptions :)
Later, I'll send changes to have a description like that:

https://source.puri.sm/Librem5/linux/-/merge_requests/623#note_212773

which should be close to what you meant, Pavel.

thanks again,

                              martin


> 
> > +       led-controller {
> > +               compatible = "pwm-leds";
> > +
> > +               led-0 {
> > +                       function = LED_FUNCTION_STATUS;
> > +                       color = <LED_COLOR_ID_BLUE>;
> > +                       max-brightness = <248>;
> > +                       pwms = <&pwm2 0 50000 0>;
> > +               };
> > +
> > +               led-1 {
> > +                       function = LED_FUNCTION_STATUS;
> > +                       color = <LED_COLOR_ID_GREEN>;
> > +                       max-brightness = <248>;
> > +                       pwms = <&pwm4 0 50000 0>;
> > +               };
> > +
> > +               led-2 {
> > +                       function = LED_FUNCTION_STATUS;
> > +                       color = <LED_COLOR_ID_RED>;
> > +                       max-brightness = <248>;
> > +                       pwms = <&pwm3 0 50000 0>;
> > +               };
> > +       };
> > +
> >         reg_aud_1v8: regulator-audio-1v8 {
> >                 compatible = "regulator-fixed";
> >                 pinctrl-names = "default";
> > -- 
> > 2.30.2
> 


