Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BC6CCA479
	for <phone-devel@archiver.kernel.org>; Sun, 17 Jul 2022 03:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbiGQDIl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiGQDIf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:35 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C7614D1F
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 20:08:34 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10c0052da61so15610045fac.12
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZY9ppo/NgfpshR/QVcrrN7xSjQ/ifkZSAsHqjerp1g=;
        b=yK4F1wdwXGsMObltazKE1YBGgXJ7B/3z//1oEVjrXiUIRUYezjGaZSVbaauKuTNxYt
         PeEUZmOiM5CFRQLxA513OwYUZZdxT5GGfHaw+sVfDmiEg9XTXzVFSBWPlm95gHuvD9vb
         hWCe+0GfYFpKQ2indy/vdeIsdnd3Wrdkw9g1hOGT7fZ9NH9W2fOpAJcOgoQf7bVfUPk8
         fCtkxWwEM0WKD8ODV1Wqtud08OsxlIemv9pAjfo+pxH3o2i08you7Lz+Ot9gv6pTF2km
         hshi/g7J3KyACHnjnoZ9xEQpKxdoZaRHzx8B+OaRoeb+65bKtETwClUr2FIKRm4NlPZo
         Hphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZY9ppo/NgfpshR/QVcrrN7xSjQ/ifkZSAsHqjerp1g=;
        b=qXR9H6/WjFvR33sUv8DmFI2H4lqdVJ6JoFAWbS4uIe95NfUyMwD5BfV3aiy0hK+5zV
         sJviLFaIUb4Se2BVxBz8AQP4GxiU/CPZheSi6kWf7Ldp+nE1NE0nossGAbkZp1gw9Pbf
         H1JJHvJdaF4ONX1j6RKG+bXi3apnFyyVOaGg+grv4VnFePd66IElxINQ4BSHZPBGL9L/
         7TNAnjYdtrOjWNqBPnrrUzyTp3hYY7p1qhPfQOoVeAl1s6Wdo7W7rDTfEkzzoyJA8kd0
         rQPevVeEY8MDXS7vChzbwxuTHpl8/u9EwdJ3aZzVivYsLWkiYvBxPHnJfm14DqbRX1AI
         8drA==
X-Gm-Message-State: AJIora/tG9hlaIzxUof5AHLenY/SQMb0C/G00kMMtvmkKDJgrsYuTlO8
        FQBUXM3TYEQ+nJRDbF5UQhmE6hRYf6nQRQ==
X-Google-Smtp-Source: AGRyM1v3nnHO6ZCxIoVgjBJgBGU1pFjvf8y7ef5TPkVxsxMBlcZmx1GEbm0kglBmRvi4ihlLzzD9lg==
X-Received: by 2002:a05:6808:e8a:b0:32e:493b:1d8 with SMTP id k10-20020a0568080e8a00b0032e493b01d8mr13621810oil.124.1658027314277;
        Sat, 16 Jul 2022 20:08:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: msm8974-hammerhead: Add notification LED
Date:   Sat, 16 Jul 2022 22:08:24 -0500
Message-Id: <165802729676.1737676.16131388789289180300.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505164336.13210-1-luca@z3ntu.xyz>
References: <20220505164336.13210-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 5 May 2022 18:43:37 +0200, Luca Weiss wrote:
> From: André Almeida <andrealmeid@collabora.com>
> 
> Nexus 5 has a RGB LED connected to the TRILED and hence channels 7, 6 and
> 5 of the LPG. Add a node describing this.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974-hammerhead: Add notification LED
      commit: 1ea9098a81133d54b3d40d7ffd197f77881e5ecc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
