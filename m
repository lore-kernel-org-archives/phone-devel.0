Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E4EC4332F
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 22:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiKYWc4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 17:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiKYWcl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 17:32:41 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604F659863
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 14:32:23 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b9so6597329ljr.5
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 14:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2N3COCpsoABwn+0bsskzOLotnro9CebmxNoSqNVqZPE=;
        b=fl3K9tvQ4SEH6fEipSAaBvQ8wajVtqxaXy7aojBVolAegYr6yc6RNZcAGvppMUdqVV
         BiLBdsZKw3Jw5YO/IR5L0UZhl/8ZDoNVrqLJdHbHumuxYgDCF9KoirGrmCx3tGEb5EmH
         SjXs2PCC16XatxYPXLD14Tax/SIkhIwyeRv5Lfq/1jjHxYD2wQCkpcBeDuqEvV9VWT9+
         vg3ipdDtgaKfkeVUmdnX0VaaobeXN4QpYnYG7sOvpIADPGVsjFTd61EOFMjr6tZaQz6S
         qUeKz7lhT/bpEJ7mmeYElwjUjnuatQGfiG0iosJrqdt4JvVSEI8kXis2C4BdUJkPTV5R
         gRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N3COCpsoABwn+0bsskzOLotnro9CebmxNoSqNVqZPE=;
        b=6Qu1qkp7Z3zntWPF9Vlp7VucxpkfRNsYxKCSB4LiOepUECYhGtAJIR+MRxZf9HiHaG
         s/xtV0BJIpKP7mCLR4+gLnt21i2dvV2+vvH8aOqzvgPNy/3lORNkNqS6G16Dm7eHQ2ED
         R3se/LAaNyhvjLY5qXApkL0FP19Bdaq89Sp55/TAi1K9Kg91PWa+qdazzYbUBICWMFCe
         HH+R9XrEHtq24PhF7E/mLBd68ZwEPwKjoSWf96Oq8xloKf/97avu0zR4ibtmOzoybXzr
         SlIffbxk78F+BmZ8V7tAfce5qlQfI6oWvqe0QKPTiSeGdGVsxI84i2wfllsr+bHpMV+W
         U9HQ==
X-Gm-Message-State: ANoB5pnvJG1XoY3yUTlU2U8tdlym3Sp6z3zp6bOECYgGfbqJGAlBCepx
        WmaSsDfGUX9GiGQqS2BtZa3fsQ==
X-Google-Smtp-Source: AA0mqf4GkR6cTDrgVrJouDjRD9NT3IT7eVNiXT0oSpQ6x8xKMDyGxOXl2TCeXN1a1GDyuKDELaJ4EQ==
X-Received: by 2002:a05:651c:12ca:b0:277:a9d:9355 with SMTP id 10-20020a05651c12ca00b002770a9d9355mr6571291lje.102.1669415541711;
        Fri, 25 Nov 2022 14:32:21 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id f7-20020a05651201c700b004b4e9580b1asm676582lfp.66.2022.11.25.14.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 14:32:21 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/4] crypto: stm32 - reuse for Ux500
Date:   Fri, 25 Nov 2022 23:32:13 +0100
Message-Id: <20221125223217.2409659-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

xperimenting by taking some small portions of the Ux500
CRYP driver and adding to the STM32 driver, it turns out
we can support both platforms with the more modern STM32
driver.

ChangeLog v1->v2:
- Minor changes to the base patches, see per-patch
  ChangeLog.

Upsides:

- We delete ~2400 lines of code and 8 files with intact
  crypto support for Ux500 and not properly maintained
  and supported.

- The STM32 driver is more modern and compact thanks to
  using things like the crypto engine.

Caveats:

- The STM32 driver does not support DMA. On the U8500
  this only works with AES (DES support is broken with
  DMA). If this is desired to be kept I can migrate
  it to the STM32 driver as well.

I have looked at doing the same for the Ux500 hash, which
is related but I am reluctant about this one, because
the Ux500 hardware has no interrupt and only supports
polling. I have a series of modernizations for that
driver that I have worked on and will think about how
to move forward.

Linus Walleij (4):
  dt-bindings: crypto: Let STM32 define Ux500 CRYP
  crypto: stm32 - enable drivers to be used on Ux500
  crypto: stm32/cryp - enable for use with Ux500
  crypto: ux500/cryp - delete driver

 .../bindings/crypto/st,stm32-cryp.yaml        |   19 +
 drivers/crypto/Makefile                       |    2 +-
 drivers/crypto/stm32/Kconfig                  |    4 +-
 drivers/crypto/stm32/stm32-cryp.c             |  413 ++++-
 drivers/crypto/ux500/Kconfig                  |   10 -
 drivers/crypto/ux500/Makefile                 |    1 -
 drivers/crypto/ux500/cryp/Makefile            |   10 -
 drivers/crypto/ux500/cryp/cryp.c              |  394 ----
 drivers/crypto/ux500/cryp/cryp.h              |  315 ----
 drivers/crypto/ux500/cryp/cryp_core.c         | 1600 -----------------
 drivers/crypto/ux500/cryp/cryp_irq.c          |   45 -
 drivers/crypto/ux500/cryp/cryp_irq.h          |   31 -
 drivers/crypto/ux500/cryp/cryp_irqp.h         |  125 --
 drivers/crypto/ux500/cryp/cryp_p.h            |  122 --
 14 files changed, 344 insertions(+), 2747 deletions(-)
 delete mode 100644 drivers/crypto/ux500/cryp/Makefile
 delete mode 100644 drivers/crypto/ux500/cryp/cryp.c
 delete mode 100644 drivers/crypto/ux500/cryp/cryp.h
 delete mode 100644 drivers/crypto/ux500/cryp/cryp_core.c
 delete mode 100644 drivers/crypto/ux500/cryp/cryp_irq.c
 delete mode 100644 drivers/crypto/ux500/cryp/cryp_irq.h
 delete mode 100644 drivers/crypto/ux500/cryp/cryp_irqp.h
 delete mode 100644 drivers/crypto/ux500/cryp/cryp_p.h

-- 
2.38.1

