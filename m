Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F7FCDB47E
	for <phone-devel@archiver.kernel.org>; Fri, 13 Oct 2023 14:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjJMOZH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Oct 2023 10:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbjJMOZG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Oct 2023 10:25:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378ACBB
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so3283758a12.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697207102; x=1697811902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVIXIq/Rm+SyJ1K4MPb2o9/YrrlOkItMvHUn3gP+p+M=;
        b=2+hII2Ff7yQE1F+kHz7eaq+T9rEv+0RPXVQQ2GIZ8DFwPX4Ja3L1ypr6A0L7pVsJ1A
         SXICGxIdinIlXXiH7lMP2tK7iN+l7W8rQ683YTEMwrhvhnG58HecBgymRiSDAjCloQL5
         Uz/d+RhHk6JwLJNL2g+1PRqFr4qMVf/XDFhV+Z86L1N00vRsF15ptHJqphODandPRP2o
         YBcltQXbzIQ7ePPYAzKhGHQO7zU4S/Q5g1PKj+Pb5xucAMUHbhDIc1atA2FqN9ianUD5
         yL0YsVwPeob4MPnptj2t1QmcBS/uWOLFmJSEpg0xi3LG0TWyyvyZC2Fnel278L9RmlTI
         6kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207102; x=1697811902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVIXIq/Rm+SyJ1K4MPb2o9/YrrlOkItMvHUn3gP+p+M=;
        b=lnZmo9JuXki0lodX0IRaP0BRZeibWISZ4TqiA462gnZ7J4mK++Uo+Rz/vOtGbCoeu2
         2uLKFEGzP0Ic1PSotSKGl+GxL8wLkHgJQRAkO1Rm8qYVKktCM5Wep0pxL4mia9JKTbv6
         Qrqc6L2DBsKD6OJyw6O7mbcaamt3yNLRBNgM7GLq2Mkp9BLY/6hinEbqC89MyX98K059
         uJRKR80LrUOXez+L4z8iQ8V9As2a9rE/rACU6GhlnkIOvGyJZtkhTUJTyy27/V7GyQhc
         2QVqjusDdh7/7hTdYW1JJPz/Ss+mNnWe6+ofhW+fIPfi8p7M/Z1CXb1AbeavBzkxeT26
         lgeQ==
X-Gm-Message-State: AOJu0YwYS+zNtY/nKCl305M5abopcYApgkBCKB2AaYlbcUBKaWXBsJmh
        w1WZcfNZl8ZoXhfAn0P1mHpm6Q==
X-Google-Smtp-Source: AGHT+IGrkNfOBCtYpSIX9yoAdhv7XuR3zDtIfuz0Sker1ZEbl3nGD0kbwEPQAYtFdaX1mSAyG0KxZg==
X-Received: by 2002:a17:907:2e19:b0:9b2:c2a9:357a with SMTP id ig25-20020a1709072e1900b009b2c2a9357amr23293471ejc.68.1697207102578;
        Fri, 13 Oct 2023 07:25:02 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ot21-20020a170906ccd500b0099df2ddfc37sm12412041ejb.165.2023.10.13.07.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:25:02 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add driver for NXP PTN36502 Type-C redriver
Date:   Fri, 13 Oct 2023 16:24:46 +0200
Message-Id: <20231013-ptn36502-v1-0-98109a430efc@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5TKWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3YKSPGMzUwMjXdNEC/NUUwPzFGOzZCWg8oKi1LTMCrBR0bG1tQA
 UkoV5WgAAAA==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The NXP PTN36502 is used in the Fairphone 5 smartphone, add a driver for
it so we can soon enable DisplayPort over USB-C on this phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: usb: add NXP PTN36502 Type-C redriver bindings
      usb: typec: add support for PTN36502 redriver

 .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  94 +++++
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ptn36502.c                   | 421 +++++++++++++++++++++
 4 files changed, 526 insertions(+)
---
base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
change-id: 20231013-ptn36502-5a87e507d36c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

