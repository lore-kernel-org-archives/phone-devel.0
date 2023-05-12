Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71ECC77B7C
	for <phone-devel@archiver.kernel.org>; Fri, 12 May 2023 13:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241356AbjELN67 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 May 2023 09:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240855AbjELN65 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 May 2023 09:58:57 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C18E4B
        for <phone-devel@vger.kernel.org>; Fri, 12 May 2023 06:58:54 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965f7bdab6bso1676101666b.3
        for <phone-devel@vger.kernel.org>; Fri, 12 May 2023 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683899932; x=1686491932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/KFs/2B7m9MZiz0WLTsjGkrH/SBAUtK2lt6sIgh0XA=;
        b=j8Qzw0Lowk/cxZNFBonlAujktmiNhfOIJJVOfo680Kzh/5Av8OSb/w7fykhFtPAaT/
         dmtk7+vfzCj6deZEfAtwVWGYBTW2yYJxVxgSXGm0ps69GH93iTzYAjNtu2h3LqW0ULjb
         xs7947lefsb43rbw1Y4vZ/LJ/mzF59vj3Iesg7bs5UWAD2LVZRo7OY1cgpqZALLuiUve
         ZmExppHvF5NaXX5OxXybJxpYHpMEodMGrASNNDS4mX8zPuuxkGSC1BfAYREnuMWg9+Ci
         KUHcXu/yTSMzsA8TT35GrWpi2BL3W3BHIlM20Gly4oHhugLl/s3JpXn3/BJlZxWr4PN2
         HpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683899932; x=1686491932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/KFs/2B7m9MZiz0WLTsjGkrH/SBAUtK2lt6sIgh0XA=;
        b=E1bezVh5EB0cKmFHN+1bp2BDKcBCblj+6YPgqepEyvFvJWvOsbTlz7/MEdbWrfbkLE
         NyyRM0ADJ5SlXdRboac0Nng2bW4fPnar0/fW0wENF+l/TGnKBeOCbsw/5doNXVewRzVw
         VIz3zDKoo60AhvLqbihPbSv8E5QGJblgY9U4RXua9d0H6svndCdpN34pnBqe2TS9z92R
         JwW74IFXBGhdX05H8Bpx6LG236a9BWoRyrlMsM6k3q5iDOdCVtLSYAdQcoyLEHBw+j1P
         C5RqxLqNbTIen6TtZGqQGCqTZQqgY+2RkZdWNiVfUWRsmK7aGhT5q2YIA6SJg5YmLRVB
         m5lQ==
X-Gm-Message-State: AC+VfDwkF9zSxT5P36l1q0MbHv//nOUA/DKo1pPh6XexjBdWm9eTyNMS
        SFrGMWkCjbU3UMSt4kMEbm/ZSg==
X-Google-Smtp-Source: ACHHUZ5gu9z6nIoI4TPFD7yn1Mzc9Dza0XUQXZZ4AyQHtno7HmWHZ9MneOnQYiLcjhLeVX+jeH0cfg==
X-Received: by 2002:a17:907:9686:b0:966:65ee:beb7 with SMTP id hd6-20020a170907968600b0096665eebeb7mr18927481ejc.71.1683899932573;
        Fri, 12 May 2023 06:58:52 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mc27-20020a170906eb5b00b00966330021e9sm5399061ejb.47.2023.05.12.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:58:52 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add WCN3988 Bluetooth support for Fairphone 4
Date:   Fri, 12 May 2023 15:58:22 +0200
Message-Id: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5FXmQC/3WNQQ6CMBBFr2Jm7ZihJYKuvIdh0dbBToItaYFoC
 He3snf5XvL/WyFzEs5wPayQeJEsMRRQxwM4b8KTUR6FQZHSVKsK+7FGO8w8xTh5tPpsiNvGXlw
 LZWNNZrTJBOfLKszDUOSYuJf3Hrl3hb3kKabP3lyqn/13v1RISLUm1qZhMurWG0mjj4FPLr6g2
 7btC86hTjbDAAAA
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add support in the btqca/hci_qca driver for the WCN3988 and add it to
the sm7225 Fairphone 4 devicetree.

Devicetree patches go via Qualcomm tree, the rest via their respective
trees.

--
Previously with the RFC version I've had problems before with Bluetooth
scanning failing like the following:

  [bluetooth]# scan on
  Failed to start discovery: org.bluez.Error.InProgress

  [  202.371374] Bluetooth: hci0: Opcode 0x200b failed: -16

This appears to only happen with driver built-in (=y) when the supported
local commands list doesn't get updated in the Bluetooth core and
use_ext_scan() returning false. I'll try to submit this separately since
this now works well enough with =m. But in both cases (=y, =m) it's
behaving a bit weirdly before (re-)setting the MAC address with "sudo
btmgmt public-addr fo:oo:ba:ar"

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Add pinctrl & 'tlmm 64' irq to uart node
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230421-fp4-bluetooth-v1-0-0430e3a7e0a2@fairphone.com

---
Luca Weiss (4):
      dt-bindings: net: qualcomm: Add WCN3988
      Bluetooth: btqca: Add WCN3988 support
      arm64: dts: qcom: sm6350: add uart1 node
      arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |   2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  63 +++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 103 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  13 ++-
 drivers/bluetooth/btqca.h                          |  12 ++-
 drivers/bluetooth/hci_qca.c                        |  12 +++
 6 files changed, 201 insertions(+), 4 deletions(-)
---
base-commit: f2fe50eb7ca6b7bc6c63745f5c26f7c6022fcd4a
change-id: 20230421-fp4-bluetooth-b36a0e87b9c8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

