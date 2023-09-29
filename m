Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A9FE743F5
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbjI2IRu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbjI2IRt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:17:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8861A8
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a64619d8fbso1867677066b.0
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695975465; x=1696580265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66rvkY6nt3zzF0mpqUIENHQMbB23JKE+nvkcL4m8tVA=;
        b=Hb9M4+i3bpVk9jMVMtYvxuidJL2C+MXI0PHKs4puyWKeSDXwpjrvVG3uyBJzIkS6j7
         rpBuWLQCdqt4WMUyMsfetASiUJSKfRsCV2rvlFa3xwnKTxngmTvlhKE6PEPEM9DozRwb
         W5dhXC44sw0ENjNtkV0i2+tR5Ms3xIKNbDCxPJtlFsyZP0/NaRDyInG1k6Lx6AeiGCBA
         zqkC3HbOAjbzFmmGIsuv9Y09QtEhyGrgKmugPfOTaxGf595v0KePZBVM1Xge+WbN8y21
         OYhsoEcYcAyGhKkbjb5cqwesGPhS9MIgWt4Og2lrIYr3fhnRKtrujrvxiKGUtEoDIHpL
         tMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975465; x=1696580265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66rvkY6nt3zzF0mpqUIENHQMbB23JKE+nvkcL4m8tVA=;
        b=ECZwWL+r7d/5JUfa304y5eWxIpnktTi8hExkh+dFTQrJrwpoaNGhNhbjp9EJ/5pAe5
         k73TZmA9VKOUAiiN1uHLal5/+YSr/VhhN4afGr5B1tZkMQq5PaG6dHXWWGFwv95lT+Qx
         HZn9Q0/qkLDf4fIVMtY9AWBl9JmA0Mh2I8hQegZhAhikm1t32PUMlIzpq/V1rq9VLghu
         PYpeNFUbpkVHCqVQGKVRnQwOdHsFHjvhlgL7Hmh8Hxhk8mvsyUWwHgXeuYybSDIrVVuS
         yA1SF0Xbgcac6jo6v5a5tQmLp7HAZGM5gZtC/XKC2zUrdIMZgWm+l7nptERjPIPsIaC3
         NCuw==
X-Gm-Message-State: AOJu0Yz7W9RjXgO81J6seFQ7fNM+umpHdgnNRVFSYEifjLTVX0tMFo73
        e/roqfHgWFHlNYTBtaNFxWHohg==
X-Google-Smtp-Source: AGHT+IEsowCAPiGmVll0HBC1o9aqBDNau907j51HRKt0KOCTcIMRKiOvbnzOQIQ53bXBnmcS9Tvceg==
X-Received: by 2002:a17:906:2243:b0:9a9:e4f8:3501 with SMTP id 3-20020a170906224300b009a9e4f83501mr2597811ejr.43.1695975465197;
        Fri, 29 Sep 2023 01:17:45 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm11873803ejo.118.2023.09.29.01.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:17:44 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Small updates / fixups for PMIC spmi-gpio
Date:   Fri, 29 Sep 2023 10:17:37 +0200
Message-Id: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGIFmUC/x2MywqAIBAAf0X23IJthdmvRIceW+0hFaUIon9PO
 g7DzAOJo3CCTj0Q+ZIk3mUoCwXzPrqNUZbMQJoqbcliOAw1esItiMdV7jPgWmvDbNuamhFyGCJ
 n8U/74X0/es02eWQAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Update the schema to use plural _gpios label in the example. And fix a
dtbs_check warning in pm7250b.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: mfd: qcom,spmi-pmic: Update gpio example
      arm64: dts: qcom: pm7250b: Use correct node name for gpios

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++--
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-pm7250b-gpio-fixup-f407ee98425a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

