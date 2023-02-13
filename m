Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFCFC636CC
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 13:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjBMNdI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjBMNdD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 08:33:03 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8924F1ADE7
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 05:32:59 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id sb24so7927429ejb.8
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17ACfK6sTFOIfyBcEI2Ei7NqcQ/n2vBuXZ8nBpxcwBk=;
        b=Xv3TxVFQx0Ak8N6vkHAj0ZXrs7q3g83mmjnxozCzuUfFFTvhwR4T4TZ8jTIW3JF4c7
         WPt9nfqzc6UpjoP1Ixg2tjWhmzXgI7HSiWuQ5L9rIkHAOMvfCPWlPQcXd4oUXhSctspA
         A/U9dtjTff6rmTZV34/mVEuEwFZ7m0FUEqbGQgtBBfVGYAnrJvmc8jKV+WKgSZ4qlK1e
         JKaDb9GzbU9MJWErlBj3yKnG+rnBhnoBxfzNCBtphsjymyv2kfrMn+3jDJm0oQPFcBvS
         pgusdFh8iMvCcNmgy4ceQbNk61HiTEHUcHL3PGmbafJ0zO/zRRmyayApGojis+x0++oH
         2OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17ACfK6sTFOIfyBcEI2Ei7NqcQ/n2vBuXZ8nBpxcwBk=;
        b=CcTy6GCSsYgDtTeElHn7C1ZvwQ7PfgHUbzQ5GIYtfVE8YEwq628/ZbJTaJHROPDZhK
         x4xbHdZpUGR6eqjkMK7u/DyLeRa5APsCi8hRmxUR1NV7xHpFuaSAV5Q+VEd9stztHqag
         GYNRQ4YUArP3hPUj/MGeHCX8tY3C1mj+ApsaBNZyBbXBpgFhswKyj/tlObI1/u4XDhte
         ykoihlL0ZTboTDUbAx/Nu1JnMxt8k2fabLMiU7iLHT6wV/PJSD6JV6LPA8PPEuKR8GU6
         eUNtxnEr50ExiUASDoPEFulAvGxucnw2nG0q1NRTn9FZUf6NNptmUuN/Xq1+cLMBW6NE
         1UKg==
X-Gm-Message-State: AO0yUKUMHUx6UnjGahjywLsm9i14kCj+3YWwiPrxuPEpAWP4fvzw7XfY
        bQ+FQIASW+09uvtUsU0mdY8vSg==
X-Google-Smtp-Source: AK7set95V1q5Z64dzDL7/jDECfxzM8SR8Szrpnkp27X+GLRAjfF1/w8jCVoZqUKtwDVuLAM1AGhulg==
X-Received: by 2002:a17:906:3857:b0:8aa:a7b6:1c4c with SMTP id w23-20020a170906385700b008aaa7b61c4cmr22062038ejc.21.1676295178181;
        Mon, 13 Feb 2023 05:32:58 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id h24-20020a170906829800b008aa0305dbe8sm6661180ejx.80.2023.02.13.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:32:57 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable remaining I2C busses on sm7225-fairphone-fp4
Date:   Mon, 13 Feb 2023 14:26:48 +0100
Message-Id: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJg66mMC/x2NQQrDMAwEvxJ0roqjmND2K6UHR5UbHeoYGdJAy
 N9j9zi7O+wORUylwKPbwWTVokuq0F864Dmkj6C+KwM5Ghz1A8bs8btYzYkx3h0zy82LH6EqUyi
 Ck4XEc5PadrwS/jS3NptE3f5nz9dxnI3o3Hh8AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The first patch consolidate the two different styles where the status
property is placed in the dts, and the second patch enables all the I2C
busses used on the phone even if no subnode is added yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: move status property down
      arm64: dts: qcom: sm7225-fairphone-fp4: enable remaining i2c busses

 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 59 ++++++++++++++++-------
 1 file changed, 42 insertions(+), 17 deletions(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-fp4-more-i2c-f90ccce84e46

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

