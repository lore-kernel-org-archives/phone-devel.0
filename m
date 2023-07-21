Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D0EB64DC
	for <phone-devel@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGUI2d (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Jul 2023 04:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGUI2c (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Jul 2023 04:28:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6BD121;
        Fri, 21 Jul 2023 01:28:31 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 59DD96606FD8;
        Fri, 21 Jul 2023 09:28:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689928110;
        bh=S2daYs/q6aqCT0TpIyUa+05O3Rn3ykyFm+Hh/ppB/7o=;
        h=From:To:Cc:Subject:Date:From;
        b=DlxTsX6WPi0EA46bobSmiVfjhwZ8LHFFBtVF+XfvRpKH7CXzKB+/qw9JTWxh8pD0g
         1AqdhIk5T5PrVyyT68YHM2rMLggw9WKJwbJzjVKLEjAYTM5/MkZAX7jze3h/En88gD
         m+PXLAS0PCZdOlSEenpzqo3PKTGbnmoCk873F8Gnn9o8we9UNwUM1Gv7FeDNAakpDa
         EHCfpc3VGhljELNiKnvGqWnOh31jcIWx5xC8vl8fDc00ynpCyKkcIYPVPFzDTYJGU9
         5YDTM5/D7BQxxf6TAPt6jbfeKugn1JFg50sClKB8PxxmOmnwyTjMX25d5zBcAe8usb
         tXOz1C6M9aFjw==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     matthias.bgg@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/3] MT6795 Helio X10 and Xperia M5: Display support
Date:   Fri, 21 Jul 2023 10:28:19 +0200
Message-ID: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Changes in v2:
 - Changed/clarified copyright addition in patch [1/3]

This series adds DSI display support for the MediaTek Helio X10 MT6795
and also adds support for the specific DSI display and its backlight,
found on the Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  arm64: dts: mediatek: mt6795: Add support for display blocks and
    DPI/DSI
  arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
  arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs

 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 251 ++++++++++++++++++
 2 files changed, 352 insertions(+)

-- 
2.41.0

