Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B55AC43217
	for <phone-devel@archiver.kernel.org>; Fri,  4 Feb 2022 18:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377577AbiBDSfi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 4 Feb 2022 13:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239193AbiBDSff (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 4 Feb 2022 13:35:35 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AF0C061714
        for <phone-devel@vger.kernel.org>; Fri,  4 Feb 2022 10:35:35 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id q186so9490180oih.8
        for <phone-devel@vger.kernel.org>; Fri, 04 Feb 2022 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RV37teyztSu6iIHbwHBJLzJhhsOEFaCSjrsYDnwiV0=;
        b=J2lKugsqqsOelxx23fM/UKwBhSyuYWR2M1TQizrHYD2ikrC+O3uKbZMn8oigUgzwlJ
         Mbj7KdLrI5pqax39QYMhRpDQPQ+CYCy1il3jODGgn9oYpR+NKNGNflAEJQEmtGuopejG
         2lsiPPfBE1Gu3d4YalRYes8TLex51pm9+/1FAgBypG44ZkbHc7dmMmAKu4lf79nbcqMs
         c/K+lj3rbNV397QFvr22kiKg7JNVQAxycXH4ZJaP8RWpniTiXirfCAXyi0BFY708xAE3
         lhFUxan5TeZpvr5Tywr6n0tUdDnu1lUsuuzEj+8xha+KNL5okhtcBdyZ0kjcdsrogOcs
         9VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RV37teyztSu6iIHbwHBJLzJhhsOEFaCSjrsYDnwiV0=;
        b=5TJMUZAyCVMsJm72Dc/2e3Ej+w772CS23R10vfi83CT2EypzppB0k1oAm99zA7COO7
         XAnPgMTEocn+gIDwH7UerZjUbg+z+BIpQ8fckS8wgswPhIRZiIUtiXwrC1TS8G9OPMpK
         0ZDVhe2VNTy+tHbc4FNxAC+H4+fNfjRBl6domXvd7h8i0Kbo3zvPaakktWpcQv//KYaG
         xp66zT+k3q9+mysIy26wAWlqGn9+DwkRtJR3x0iujglMVuFdnkZifpL0ROh9/x5AQURZ
         WLcK/CXk/KWT8PoLVd/fAqAfLJfYxr4gtLuytv2msEcT50sMB++sstmqO2TK8Rl6X9gp
         HsZQ==
X-Gm-Message-State: AOAM532/3f3UYkdHQvIUtB+nSQQFXpYs/7tsKJn4FCCQKSaeLqzkSNY2
        qa6FqLzbpZzwiOX9Ge/gskxp6g==
X-Google-Smtp-Source: ABdhPJwLrqtdlHCDJLUaL8azu5O2edCBdodh/n7Kbm/AUBkzmQIRKBxs+HfB24R8haOl4qjl3/skrg==
X-Received: by 2002:a05:6808:1391:: with SMTP id c17mr132433oiw.333.1643999735231;
        Fri, 04 Feb 2022 10:35:35 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Elliot Berman <eberman@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Alex Elder <elder@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3] firmware: qcom: scm: Add IOMMU pool size and
Date:   Fri,  4 Feb 2022 12:35:23 -0600
Message-Id: <164399969244.3386915.6006488564118544541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208083423.22037-1-marijn.suijten@somainline.org>
References: <20211208083423.22037-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 8 Dec 2021 09:34:20 +0100, Marijn Suijten wrote:
> These patches clean up a leftover duplicate assignment following the
> initializer that already set the same values; followed by introducing
> two extra SCM calls that allow setting the maximum IOMMU pool size and
> changing the pagetable addressing mode to AArch32 LPAE or AArch64
> (per-context).
> 
> AngeloGioacchino Del Regno (2):
>   firmware: qcom: scm: Add function to set the maximum IOMMU pool size
>   firmware: qcom: scm: Add function to set IOMMU pagetable addressing
> 
> [...]

Applied, thanks!

[1/3] firmware: qcom: scm: Remove reassignment to desc following initializer
      commit: 7823e5aa5d1dd9ed5849923c165eb8f29ad23c54
[2/3] firmware: qcom: scm: Add function to set the maximum IOMMU pool size
      commit: 943515090ec67f81f6f93febfddb8c9118357e97
[3/3] firmware: qcom: scm: Add function to set IOMMU pagetable addressing
      commit: 071a13332de894cb3c38b17c82350f1e4167c023

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
