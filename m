Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926D6CCA486
	for <phone-devel@archiver.kernel.org>; Sun, 17 Jul 2022 03:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiGQDIk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiGQDIe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:34 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6FD014D01
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 20:08:33 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id v19-20020a9d69d3000000b0061c78772699so6610892oto.11
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRY8TYTDlO1ScT33gTMdxfz7anb7qpeeuFZvIlj6hGU=;
        b=VfB/2er3v4hJLmBKGHNWZkc2KGiaZ+9qmquuvuRYboV+qCzkLfwFbxHCzDdoNg4obx
         7SA0Oec43EN+nv9IyKsDo7FzFvQkzYdUC+OfpCiu2dzrHs4VVqH/+oMDCstc37LaOJwI
         d5TGLKlagLHJT3f7wMf8f7kgRJYGZ7gjsOoiY/KUhvv97M8CfeqACONPOpXro9riekDD
         Qv17tap0qRvjiTnc1cWrOXjjt5he8pSBU9/3rSkILZcF7cWzw3eNt9SG96rJkyuKc81u
         X6nP4MIRoEITWuPAswjfKXBBy1iPpEuB7P29uDc7jKH0vsM1Mg1Lnjc1hNFTXv1yDx0b
         E/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRY8TYTDlO1ScT33gTMdxfz7anb7qpeeuFZvIlj6hGU=;
        b=B5q403mXL5oG0RwnyjsmlXgYM2VCK34tb0VafsvGHijsI+IE++FJhIOXkxIe7uEeLS
         c6C9QV2QI7PqEQOuTPIMq6WBaqH8K9GFXvZRbaWoDHbc/JibaYP4a9h40UdSHOEyTkk5
         y05Z85cKb3eoEtuYf3M/LmpMzKa605/7ZXj73nbBI64UquE4omm5wxROMx+UfxJbfB76
         ztZWMxMjPPDFbWvUaxJ3ng+oWw/RJVq9dFxFCLSCLl/YH0XUogvXD8VVi/nSvCwQxhqQ
         waLBeJWS9FAqaCZ18fnSO+BBCn3Pg02KW2sVmwS5W6aOzmW7ZNEpqM+hvsjVoaI7+UIG
         dAug==
X-Gm-Message-State: AJIora/SvM7vyRMtF16ytAwyKvt2z8PoYSN8TOKhP+yu7hNkSR4yRgCC
        atibs5C+VEHtXJ6uMZA9LXYAvQ==
X-Google-Smtp-Source: AGRyM1uEzLW+Jw+QFP2i3PlIlRQD5YNnT6mLe+aL6iDEqYP35qWmkR5ioofrZcsJPGG4Lx6T2l6wfQ==
X-Received: by 2002:a9d:1784:0:b0:60b:f7a8:7cc9 with SMTP id j4-20020a9d1784000000b0060bf7a87cc9mr8675696otj.96.1658027313267;
        Sat, 16 Jul 2022 20:08:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: msm8974-FP2: Add notification LED
Date:   Sat, 16 Jul 2022 22:08:23 -0500
Message-Id: <165802729676.1737676.8867174109344520597.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505163029.6541-1-luca@z3ntu.xyz>
References: <20220505163029.6541-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 5 May 2022 18:30:29 +0200, Luca Weiss wrote:
> FP2 has a RGB LED connected to the TRILED and hence channels 7, 6 and
> 5 of the LPG. Add a node describing this.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974-FP2: Add notification LED
      commit: a037fcabdbdd8615e17add98c2638df529ff2e3c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
