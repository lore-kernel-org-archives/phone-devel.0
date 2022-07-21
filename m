Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9963CCA490
	for <phone-devel@archiver.kernel.org>; Thu, 21 Jul 2022 13:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiGUNnv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Jul 2022 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiGUNnB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Jul 2022 09:43:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9684F82FB4
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 06:42:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u13so2864036lfn.5
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OlrA4aslqLMnxqVvAtkDsO1/WINFttVW+0JawkwP3pw=;
        b=qoM8TeC20pNuuY6iL7VUi3Voz9NpK162VWFoXK22FifWi0TXCN+eDbtHIWNh4t50y0
         3CNg+vTQWZuzvUfut2sJMG3juX06w2Zlrluy+qD/eQ/bfCKyKZA0STao8frQOFzXavMy
         Jy+KfaCoT2U4d8yg3THRU1oOc4WDkNmJx3tqNP7GRbp/cQkWpVEX1XiaJGNdLHecO3yp
         YywMkNtwV/hrp5mFADrMhn9vQitPHFY/6CKBLrmqVY8X78ch6U+2pfSMsoSbmEAdfRnq
         kU5JUqo+z5OtFBSoc7gSkMCoBYwMOE0SmHSMLpAfHqqu1HksB02JrUwxk/pBu+iddOEJ
         B6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OlrA4aslqLMnxqVvAtkDsO1/WINFttVW+0JawkwP3pw=;
        b=x2owxV7NvEoxaEYh96wMwLXA+BWiyZbq3Qptt+XKgco57KCPnc9sAzdIKboNxCHmWs
         DosovpD65enGGn1fYQHwbPN7ARflXeHX9C1mycOGbuKBRF9GRaalciCuTQ1hHVSvmlZ1
         wXHe7J1+Py6DNabImSx9WX3klGiXA/ZHlUFmLgbpONoLwM5TGthXBBl/BYk5SGsbX53Q
         PXNL+oiFjMpwaBcVek4FBy3AO/VoRWkWNEdQuE6DSlWJw9VOfqWTFzL5HrQvC6rLzSHu
         JWIhwpRWcYb6l8fKdJijrYqwR/1PL3cmcl7SmQFON9q4gLcnOCGrLRyW9VpEe9A/9Of9
         3mdg==
X-Gm-Message-State: AJIora/QIK0+H/OFEsXF3a+G51KbmAYYFcudVcpDmbZsavJbsGSFalXD
        z+3+cdvA4Pn5/bpeLO2RDND6g0eL0YfGzQ==
X-Google-Smtp-Source: AGRyM1sEqvU9xBwqqi9i1CKGOI5WSuZpn9Pb60ReR+UoPT8YvLVKi/S8o42XRlDzwxHGYb7hduu83g==
X-Received: by 2002:a05:6512:3984:b0:489:e65c:4627 with SMTP id j4-20020a056512398400b00489e65c4627mr23195394lfu.72.1658410974806;
        Thu, 21 Jul 2022 06:42:54 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o23-20020ac24e97000000b004867a427026sm458568lfr.40.2022.07.21.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:42:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/15] Ux500 hash cleanup
Date:   Thu, 21 Jul 2022 15:40:35 +0200
Message-Id: <20220721134050.1047866-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This cleans up the Ux500 hash accelerator.

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

Linus Walleij (15):
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
  crypto: ux500/hash: Convert to regmap MMIO
  crypto: ux500/hash: Use AMBA core primecell IDs
  crypto: ux500/hash: Implement runtime PM
  crypto: ux500/hash: Drop regulator handling

 drivers/crypto/ux500/Kconfig          |    1 +
 drivers/crypto/ux500/hash/hash_alg.h  |  260 ++-----
 drivers/crypto/ux500/hash/hash_core.c | 1028 ++++++++++---------------
 3 files changed, 479 insertions(+), 810 deletions(-)

-- 
2.36.1

