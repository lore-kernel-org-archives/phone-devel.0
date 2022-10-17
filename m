Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F50C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 17 Oct 2022 12:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiJQMfD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Oct 2022 08:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiJQMfB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Oct 2022 08:35:01 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C5C23E94;
        Mon, 17 Oct 2022 05:34:51 -0700 (PDT)
Received: from p508fc122.dip0.t-ipconnect.de ([80.143.193.34] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1okPKO-00087p-VC; Mon, 17 Oct 2022 14:34:45 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: add BT/wifi nodes to Pinephone Pro
Date:   Mon, 17 Oct 2022 14:34:41 +0200
Message-Id: <166601006785.173248.11280967580490159718.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002092809.451501-1-tom@tom-fitzhenry.me.uk>
References: <20221002092809.451501-1-tom@tom-fitzhenry.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 2 Oct 2022 20:28:09 +1100, Tom Fitzhenry wrote:
> Pinephone Pro includes a AzureWave AW-CM256SM wifi (sdio0) and
> bt (uart0) combo module, which is based on Cypress
> CYP43455 (BCM43455).
> 
> The CYP43455 datasheet ("Power-Up Sequence and Timing") documents:
> * needing to wait 10ms between consecutive WL_REG_ON toggles
> * needing to wait 110ms between power-on and SDIO access.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add BT/wifi nodes to Pinephone Pro
      commit: a7e6dbd6ac034480d7fde95ecf2259d27e5655b1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
