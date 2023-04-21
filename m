Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6589AC7618E
	for <phone-devel@archiver.kernel.org>; Fri, 21 Apr 2023 14:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjDUOLu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Apr 2023 10:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjDUOLt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Apr 2023 10:11:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5EBB77A
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 07:11:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f7a7a3351so285081266b.2
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1682086302; x=1684678302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPD5TcepChIUyB1x+7Snz5I2ALaHEaijNEsj7LUHZPA=;
        b=SGnUbBPtbMuGlGP7xgkjvYNprt/tmwJukkiW4SLbD+eD/CdrjoXNA0p80kH6A46gFO
         maSZwJRhDipvRmudtViB0d3B5aAUO3EALglvWabl8Maxr0x0PjQYyCoaDYKRdchvf3AF
         1XTScpJja6tJ5FirRR1MFIPnMT6WOVnNLAw1O38AqrafLFWIDlfw7/v68W+Zw+42Xo34
         1fFoyz/wz7dOgbI200Bt88lDOK6wFt5Rjx51JU3oRmjlT36eWayGqlP4PARwVGNhEf60
         HaesoU6a/AbcpRozeREASEWLEbTgSACsCCgM8V0nqINY32A4/PKAqHI4FatAFO7VnSgI
         OsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682086302; x=1684678302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPD5TcepChIUyB1x+7Snz5I2ALaHEaijNEsj7LUHZPA=;
        b=Di1veA2LC5lTUY61Ei0h0x0u8rJYi+GvLHgXzXWQuNo9W6psrS4Jggt02a66tFjT+W
         LMzcHwY6avCgzMxsrfhhkfpdrS+g2cNPHCYPzCtDzzMkQILHaMSR88D+WWlU0tBiNYer
         luW5oixdHH668SyU9eEmkdYFue/BmjBnIIBSWUa8cjxKE3qQ7mWZ87Ei4DAbdc/xxmUx
         mqTwwWF7u56k/B9OKddbq2cfn7WpV9B4adAtd0wX0gkhhyld1jH4hkHMQxPJ4v5vp6cB
         3wqHBJTYWui1Mh8yXDP5uj9CDI5oc/Oc6fBHuUQmpvVKkiholpDy0sSoQfFZK25Taeif
         om4g==
X-Gm-Message-State: AAQBX9dd8VP8oD8n9gRNrOv5gZ4g6bssunxAJKw17flToqq/0WP6RPhH
        8x1jS2g0qwN/J348pdIgjSmceA==
X-Google-Smtp-Source: AKy350azULtknnyQgZXmslDuOdRO/uK9oaFqyUGWWmEXSB8R6Pd3XgFf/p61ksQZOPAwTDxYV8cQSw==
X-Received: by 2002:a17:906:9c44:b0:94b:4a4:2836 with SMTP id fg4-20020a1709069c4400b0094b04a42836mr2241258ejc.69.1682086301764;
        Fri, 21 Apr 2023 07:11:41 -0700 (PDT)
Received: from [172.16.220.31] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mb20-20020a170906eb1400b0094f432f2429sm2104299ejb.109.2023.04.21.07.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:11:41 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/4] Add WCN3988 Bluetooth support for Fairphone 4
Date:   Fri, 21 Apr 2023 16:11:37 +0200
Message-Id: <20230421-fp4-bluetooth-v1-0-0430e3a7e0a2@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmZQmQC/x2NQQrCMBAAv1L27EKaFq1eBR/gVXrIxq1ZCElJW
 imU/t3F4wwMs0PlIlzh1uxQ+CtVclJoTw344NKHUd7KYI3tTG9bnOYeKa685LwEpO7sDA8Xuvo
 BtCFXGam45INWaY1R5Vx4ku0/ecHzcYfxOH6EglTSeQAAAA==
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Just to start with the important part why this is an RFC:

While Bluetooth chip init works totally fine and bluez seems to be
fairly happy with it, there's a (major) problem with scanning, as shown
with this bluetoothctl snippet and dmesg snippet:

  [bluetooth]# scan on
  Failed to start discovery: org.bluez.Error.InProgress

  [  202.371374] Bluetooth: hci0: Opcode 0x200b failed: -16

This opcode should be the following:

  include/net/bluetooth/hci.h:#define HCI_OP_LE_SET_SCAN_PARAM    0x200b

Unfortunately trying various existing code branches in the Bluetooth
driver doesn't show any sign of making this work and I don't really know
where to look to debug this further.

On the other hand "discoverable on" makes the device show up on other
devices during scanning , so the RF parts of the Bluetooth chip are
generally functional for sure.

Any ideas are welcome.

@Bjorn: Patch "arm64: dts: qcom: sm6350: add uart1 node" should be fine
to take regardless the RFC status, I don't think the problem is caused
there.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: net: qualcomm: Add WCN3988
      Bluetooth: btqca: Add WCN3988 support
      arm64: dts: qcom: sm6350: add uart1 node
      arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 17 ++++++
 drivers/bluetooth/btqca.c                          | 13 ++++-
 drivers/bluetooth/btqca.h                          | 12 ++++-
 drivers/bluetooth/hci_qca.c                        | 12 +++++
 6 files changed, 115 insertions(+), 4 deletions(-)
---
base-commit: cf4c0112a0350cfe8a63b5eb3377e2366f57545b
change-id: 20230421-fp4-bluetooth-b36a0e87b9c8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

