Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B50C433FE
	for <phone-devel@archiver.kernel.org>; Wed,  3 Nov 2021 12:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 068BF61076
	for <phone-devel@archiver.kernel.org>; Wed,  3 Nov 2021 12:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbhKCMfU convert rfc822-to-8bit (ORCPT
        <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 3 Nov 2021 08:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbhKCMfT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 3 Nov 2021 08:35:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A05C061714
        for <phone-devel@vger.kernel.org>; Wed,  3 Nov 2021 05:32:43 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1miFRL-0004xx-V4; Wed, 03 Nov 2021 13:32:27 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1miFRL-000BSX-DO; Wed, 03 Nov 2021 13:32:27 +0100
Message-ID: <6d6feb1ac100bb68f9e090582af2278a2e407104.camel@pengutronix.de>
Subject: Re: [PATCHv3 1/4] media: imx: Remove unused functions
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Wed, 03 Nov 2021 13:32:27 +0100
In-Reply-To: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: phone-devel@vger.kernel.org
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 2021-10-19 at 14:13 +0200, Dorota Czaplejewicz wrote:
> Neither imx_media_mbus_fmt_to_ipu_image nor imx_media_ipu_image_to_mbus_fmt
> were used anywhere.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
