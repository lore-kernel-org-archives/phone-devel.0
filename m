Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C535CE748E9
	for <phone-devel@archiver.kernel.org>; Sun,  1 Oct 2023 17:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbjJARTK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Oct 2023 13:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbjJARTJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Oct 2023 13:19:09 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F883
        for <phone-devel@vger.kernel.org>; Sun,  1 Oct 2023 10:19:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40652e5718cso34762805e9.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Oct 2023 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696180745; x=1696785545; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DoAruSQ2PEExSjxSpWnWe6tRqyQqBMYlEcNbnJ/r0E=;
        b=U1RTAeGvk8t4PHlLgEjQ0UnuoMp8a9PmCgzRwUi7O1EL7+T58EHRA6UWRQCS1sSqU3
         sKFhSuIDYLrV07KGb93mH4Dg2CgZwodIxbZPNnHOuq+RCY93A1/+qieTlGErlbcl2hBT
         l9CaKbjKOSRI7SG4YhGFPtkK3iZhOcbvkbUYtjIxgf8isVJG3iWnXshxWD7QY7+UQBHM
         d/HuNASXgT1diEaNDRJkqBElLSUtehJZk5bJsJMORKYz1BK1Nbslz2V0UUjF7qiof6cw
         ZcHgd95S16baTlD8KZMjgN7AliukYJvCaa9XjaRB9SGhsvYSyltccfyMyJyoaJ+RJPow
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696180745; x=1696785545;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DoAruSQ2PEExSjxSpWnWe6tRqyQqBMYlEcNbnJ/r0E=;
        b=E5ehzxOUqOfyi0ufJlgEcPCrMIisATr0x+Dsv6/31hBJXm9AZLqGPrxVM5txLye7oJ
         rxqnpyRb5puTc08uGjtaRCs6hUcPYNZ63BmV3AkulSVVt53aPWaluQxz1L3EarfLxW+1
         APZF/I6bciqTxSy5EgXy61mkORR8ibQm5H0dbBeBEobOxu4ARH+A/jdA5ev5U2fYDGBb
         Iuf+tPiGtbLV4W50Or89jmQLaIMpsQMB3ULezOyDuTkFhWV1q8DM20GIRzuKQFNcS/FK
         RPTXyvfgF2CDJgVnANzzPA1KSuQ0vtxg9h6+OrIYi6o9v0+GiEdq8RpsvjWBhDv9cq6H
         nl6Q==
X-Gm-Message-State: AOJu0Yx0sYC+CKboz6KLLeNua2pit/M3X0syK+AuP/wdP1kSiZkOhe8S
        iCKn3rPGEfHF11cBQ2uZkqzebg==
X-Google-Smtp-Source: AGHT+IFvKMowdEWmmIeJ8R6/Jw9QpL2bbdSSOp+vGwmcRxQnzwcEQDgWM0dTMU73eBhIHlJgh9X/Jg==
X-Received: by 2002:a05:600c:3d98:b0:406:52e4:cd23 with SMTP id bi24-20020a05600c3d9800b0040652e4cd23mr8145300wmb.0.1696180745633;
        Sun, 01 Oct 2023 10:19:05 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c294900b00401c595fcc7sm5613042wmd.11.2023.10.01.10.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 10:19:05 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/2] dts: qcom: enable flash LED on OnePlus 6 and PocoPhone
 F1
Date:   Sun, 01 Oct 2023 18:19:02 +0100
Message-Id: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAaqGWUC/x2NywqDMBBFf0Vm3aGJpq32V4qLPCZNoCZtRkQQ/
 73R3T1wD2cDphKJ4dlsUGiJHHOqIC8N2KDTmzC6ytCKtpNCSDQK2U29uqH/aA7oZsbOimFQj97
 chYFqGs2Epuhkw+H+bJ4w0TpffS7nOE7fQj6uZ/o17vsfwNK+X4oAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=633;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=PwO2JXtzGVYrZeUs2/yiP04KNwmovTH7uq8YtscE+Lk=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlTJVRzSpu6NEbvvfk1/OuvMtgtB9zbOfi/xVe5O3LZQV
 nnNX7muHaUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAiCYIM/wsl0liN1mivFJqy
 +ObKzdnPZqrZv5Cz+NameM+71nrRjxCGf1oVnMK2+kHtVqWe506/iPgserRp/6P34Ue2zJokerv
 ww1IA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Like the SHIFT6mq, these devices both feature a dual-tone flash, enable
them.

Both patches have been shipping in postmarketOS for a few months now with no
known issues.

---
Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: enable flash LED

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable flash led

 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 ++++++++++++++++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 22 +++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 4b9e79bf480770216d598ed9383c675d50b0ae92

// Caleb (they/them)

