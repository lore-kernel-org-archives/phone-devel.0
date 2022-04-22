Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50073C433EF
	for <phone-devel@archiver.kernel.org>; Fri, 22 Apr 2022 14:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448786AbiDVOo7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 22 Apr 2022 10:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448531AbiDVOo6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 22 Apr 2022 10:44:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128245BE58
        for <phone-devel@vger.kernel.org>; Fri, 22 Apr 2022 07:42:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id g13so16849179ejb.4
        for <phone-devel@vger.kernel.org>; Fri, 22 Apr 2022 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YPSNiy/WSLKetqRwGH3dF+rpEOiPZlSHrWRqFedtnF4=;
        b=0tMdoCP+ffWO8q+DJhG8ohmRQyh6tnncLT6Cx/QL2gX3NNf11NX+1xXnpNqWcX9C/c
         SXvYE9BZjUl2uC/vA500HXE9W2f1dBELQg9JK7sBOYRFdTpUPtV6esJpsWmIANrRlNI7
         xt5iORgxgkN7mv0ECZQh5BeJtaBc4uhhiQz+ssGkZt0lQBgun1jmVjYBWQ5z833zWxLq
         L4ZHcA+jPDCeCiWadUjPrWczRjk64kud7El/qGkL8gi/T6JKE7r5Toyh+PRigo95R8Pg
         ccD87UoISQEEvYGDxU79Ev95zWrhp7qCkMf/s1WqKNmzp7TIrbmSOxtHNT5a+C9ecx6Q
         2PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YPSNiy/WSLKetqRwGH3dF+rpEOiPZlSHrWRqFedtnF4=;
        b=MQWsDkcTiMS/IM8nS63GIkrWt1HTmOVo/ceshqfw7jcTuSO4fEBKgdg9UOGsfHLEwe
         s6fQSCBt8yaNKjpcwOagkZll2gLX48mbyiHzbd51kT9Bch7MeiLs+zBKyhzngGVyenIB
         q6t0rh0gUQTFWEcT1VUNRF/Tor+Z6R5pWOQflj0YLWzMQ87lcC2yL42ziITXgtd3Td+Z
         gdEwNwGIXgyQ2bh8UqO6u5/p+uHV+C2lw432XfBJK+OtTqSRAMmGhbFR2RcHD8ZntpsT
         lGloiIQ4x9Y+zt4IBHSup+/OweAaM8ORPEgZaP1sXx40J+zvm1VmZjfb10R41zoMEI2P
         C2Kg==
X-Gm-Message-State: AOAM533HX27wg1RnsCW/B7MiybQKUzxpUSnM/+jkY/JnmuaqgX5k+fCJ
        UHJ2llSSfUMveTU+tgD3di/miQ==
X-Google-Smtp-Source: ABdhPJysMwN6dg4jeawpJnY1cyANQrKMCfiG/FlpuhM3iJwkjTZkcHyc9G9XIGVn5vqtoFhXrjcolQ==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id gt42-20020a1709072daa00b006da924e0955mr4491227ejc.1.1650638522573;
        Fri, 22 Apr 2022 07:42:02 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090626c600b006e74ef7f092sm818202ejc.176.2022.04.22.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:42:02 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        devicetree@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [PATCH 0/4] Add interconnect support for SM6350
Date:   Fri, 22 Apr 2022 16:40:16 +0200
Message-Id: <20220422144021.232993-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series adds interconnect support for the various NoCs found on
sm6350.

A more special modification is allowing child NoC devices, like done for
rpm-based qcm2290 which was already merged, but now for rpmh-based
interconnect.

See also downstream dts:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/tags/android-11.0.0_r0.81/qcom/lagoon-bus.dtsi

Luca Weiss (4):
  interconnect: qcom: icc-rpmh: Support child NoC device probe
  dt-bindings: interconnect: Add Qualcomm SM6350 NoC support
  interconnect: qcom: Add SM6350 driver support
  arm64: dts: qcom: sm6350: Add interconnect support

 .../bindings/interconnect/qcom,rpmh.yaml      |  44 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 109 ++++
 drivers/interconnect/qcom/Kconfig             |   9 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/icc-rpmh.c          |   4 +
 drivers/interconnect/qcom/sm6350.c            | 493 ++++++++++++++++++
 drivers/interconnect/qcom/sm6350.h            | 139 +++++
 .../dt-bindings/interconnect/qcom,sm6350.h    | 148 ++++++
 8 files changed, 948 insertions(+)
 create mode 100644 drivers/interconnect/qcom/sm6350.c
 create mode 100644 drivers/interconnect/qcom/sm6350.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm6350.h

-- 
2.36.0

