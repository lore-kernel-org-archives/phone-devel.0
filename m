Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C88C25B0E
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 14:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbiHPODA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 10:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbiHPOC7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 10:02:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA6027FD5
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 07:02:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r17so15038682lfm.11
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=psbLplD4dNjEprFTWJqYf9xWkagYDHJoXwCz4vDrUHs=;
        b=dFXJN9lxoFQT21kIAH+3QnGSecPFLqrXqVQffWWxJwGfBbNUcZdOSvcAQ9dO5HXpzt
         98gSL5XQ4W2GVRVyDcE4pd8HRcQJSNS+CbTliv7y9VjEft7IX8Z9Cyyz3NnAva/w5YUI
         5sVxjlp0JvT6tINKXhf6KXCXF9eyWU1yX5Fs9yHdS+PZeotlIm2ZEGYckS2rCYyWXNq/
         35gwxkLnsxfvipc5H+OqjBT5wCc0bte03X8Pjh0onJC2+ke1XkWamze2F4GKdp6uGamZ
         22352X45vda05IsXQencrp3Zl/pYr7+eNz379SYHAY0N8Mlb7ewZcMUtO751JmB1o45z
         jmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=psbLplD4dNjEprFTWJqYf9xWkagYDHJoXwCz4vDrUHs=;
        b=pIDQllp6qCb4n3A1w6UJL8Nvml4y0fHAjvkNXlvmnIW4hh3JQi7nAkHH9zdvwxnZQ4
         yCLTuGnFoisr1dqwlwTBAa199gxeqM3e0vYy3RlZT7XA/j/zsNU8B9osmym3uPlGickL
         UwxoPq+jUC0IjWQGXLWowgnq/UWUZt4kgsrqOdUnWPVJ2UIlnzVt9oCssa8s0aS8FtQ3
         zCsOIwZbqLqVNFsWOQBNguR9ZTPFPi/ScD4CLHkBwBOYZ2WStjKGCdvGd//c1c12ygko
         M9tkHI31r5tWYhoAPjKBLrjxBDytglJKqhynJ8JqjxUYrdaPLxAP0hrT2nHQNsbkl5yn
         O3JQ==
X-Gm-Message-State: ACgBeo2iOrPqnrijyJ3oDnQ3KppHhpt0UW1hOYd/LU8YGAMcKJJK2yPR
        +xDX0O/Azb4ZSJYQinWSstQJrg==
X-Google-Smtp-Source: AA6agR52edQXKU2V2hqiLrVcNRtREoArsQDVxE22/dliHLoPDw6TjRqjqIf49mFpU0ljyLlEg3yIeg==
X-Received: by 2002:a05:6512:12c4:b0:48f:aca0:f94e with SMTP id p4-20020a05651212c400b0048faca0f94emr7445636lfg.296.1660658575681;
        Tue, 16 Aug 2022 07:02:55 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r27-20020a2eb61b000000b0025e739cd9a7sm1747902ljn.101.2022.08.16.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 07:02:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 00/16] Ux500 hash cleanup
Date:   Tue, 16 Aug 2022 16:00:33 +0200
Message-Id: <20220816140049.102306-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This has been very sparingly maintained the last few years,
but as it happens an active user appeared and sent me a
bug report, so here is a series cleaning up the driver
so we can maintain it going forward.

Most patches are modernizations, using new frameworks and
helpers.

The expensive self tests are passing fine after this series.

I think it is a bit too big to backport to stable :/
But please put it in as non-urgent fix.

If this goes well the plan is to do the same for the crypto
driver which has all the same problems.

ChangeLog v2->v3:
- Rebase on v6.0-rc1
- Use accelerated noinc regmap MMIO

ChangeLog v1->v2:
- Iron out some minor runtime bugs.
- Fix a regmap initialization error.
- Fix up to use runtime PM and drop custom power states.

Linus Walleij (16):
  crypto: ux500/hash: Pass ctx to hash_setconfiguration()
  crypto: ux500/hash: Get rid of custom device list
  crypto: ux500/hash: Pass context to zero message digest
  crypto: ux500/hash: Drop custom state save/restore
  crypto: ux500/hash: Drop bit index
  crypto: ux500/hash: Break while/do instead of if/else
  crypto: ux500/hash: Rename and switch type of member
  crypto: ux500/hash: Stop saving/restoring compulsively
  crypto: ux500/hash: Get rid of state from request context
  crypto: ux500/hash: Implement .export and .import
  crypto: ux500/hash: Drop custom uint64 type
  crypto: ux500/hash: Drop regulator handling
  crypto: ux500/hash: Convert to regmap MMIO
  crypto: ux500/hash: Use AMBA core primecell IDs
  crypto: ux500/hash: Implement runtime PM
  crypto: ux500/hash: Use accelerated noinc MMIO

 drivers/crypto/ux500/Kconfig          |    1 +
 drivers/crypto/ux500/hash/hash_alg.h  |  262 ++----
 drivers/crypto/ux500/hash/hash_core.c | 1152 ++++++++++---------------
 3 files changed, 533 insertions(+), 882 deletions(-)

-- 
2.37.2

