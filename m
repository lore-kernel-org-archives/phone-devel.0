Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EC8C433F5
	for <phone-devel@archiver.kernel.org>; Fri, 15 Oct 2021 07:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77F760FC3
	for <phone-devel@archiver.kernel.org>; Fri, 15 Oct 2021 07:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhJOHUj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 15 Oct 2021 03:20:39 -0400
Received: from comms.puri.sm ([159.203.221.185]:41482 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230371AbhJOHUi (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Fri, 15 Oct 2021 03:20:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 8A7C4DFDE2;
        Fri, 15 Oct 2021 00:18:32 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pN6AueyW3-k3; Fri, 15 Oct 2021 00:18:31 -0700 (PDT)
Message-ID: <f5884e3a4db47f9cdaa64857718b57804da5ef4c.camel@puri.sm>
Subject: Re: [PATCH v2 7/7] arm64: dts: imx8mq-librem5: set debounce
 interval of volume buttons to 50ms
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date:   Fri, 15 Oct 2021 09:18:23 +0200
In-Reply-To: <20211015014632.GC10197@dragon>
References: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
         <20211005134902.2138731-8-martin.kepplinger@puri.sm>
         <20211015014632.GC10197@dragon>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Am Freitag, dem 15.10.2021 um 09:46 +0800 schrieb Shawn Guo:
> On Tue, Oct 05, 2021 at 03:49:02PM +0200, Martin Kepplinger wrote:
> > From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> > 
> > The default of 5ms is too low.
> > 
> > Signed-off-by: Sebastian Krzyszkowiak
> > <sebastian.krzyszkowiak@puri.sm>
> 
> Your SoB is missing here.  I fixed it up and applied the series,
> thanks!
> 
> Shawn

thank you very much, of course I sign-off on this.

                      martin


