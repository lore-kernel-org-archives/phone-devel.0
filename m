Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB2C433E0
	for <phone-devel@archiver.kernel.org>; Sun, 10 Jan 2021 12:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F525229C7
	for <phone-devel@archiver.kernel.org>; Sun, 10 Jan 2021 12:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbhAJM0K (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 10 Jan 2021 07:26:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:53352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbhAJM0J (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Sun, 10 Jan 2021 07:26:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D458D2250E;
        Sun, 10 Jan 2021 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610281528;
        bh=tpQi5dhPDHJXJjfIpmdIZMwrGNm8niVLLpqxQMMz7Lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qr7lfKrMQbBGbdO8VANtEcFTu1KKtE6EiiVjwYYki5DGVxpHC/M/03ebkD2pBzX2j
         +fqky41110PB/vckgD9ABc//e4FwVgxmgmwPwbHxs5XZf/7wzRIfVYRPl8lA7EkKwU
         2mT6eXvOXkk+QW6T9d7OyMNA1sTnUUQYphvHz96Qp5fezkH7yPT0EilLMOH3wVQKhF
         L3J2+vz4h7uTzvDDZffjW27L6XJsNjIKd/URIXwcqOiBIcsjJsul9QyuCn59z/0Y/o
         0lUr92Gt8IyyouUeTV9d/8AjyvimAcSsjnEilhUwueaQqhs/66YQOcBFqfjqjeECxJ
         AN2s2xB7+508w==
Date:   Sun, 10 Jan 2021 20:25:21 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Angus Ainslie <angus@akkea.ca>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Li Yang <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mq-librem5-devkit: Drop custom
 clock settings
Message-ID: <20210110122521.GL28365@dragon>
References: <cover.1608216796.git.agx@sigxcpu.org>
 <3343e82ab52e753b385a3e451c07b774920790fc.1608216796.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3343e82ab52e753b385a3e451c07b774920790fc.1608216796.git.agx@sigxcpu.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Dec 17, 2020 at 04:13:15PM +0100, Guido Günther wrote:
> Otherwise the boot hangs early on and the resulting clock tree without
> this already closely matches the selected rates (722534400 and
> 786432000).
> 
>   audio_pll2                  0        0        0   722534397          0     0  50000
>      audio_pll2_bypass        0        0        0   722534397          0     0  50000
>         audio_pll2_out        0        0        0   722534397          0     0  50000
>   audio_pll1                  1        1        0   786431998          0     0  50000
>      audio_pll1_bypass        1        1        0   786431998          0     0  50000
>         audio_pll1_out        1        1        0   786431998          0     0  50000
>            sai2               1        1        0    24576000          0     0  50000
>               sai2_root_clk       1        1        0    24576000          0     0  50000
>            sai6               0        0        0    24576000          0     0  50000
>               sai6_root_clk       0        0        0    24576000          0     0  50000
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Applied, thanks.
