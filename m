Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704B7C43217
	for <phone-devel@archiver.kernel.org>; Wed, 15 Dec 2021 22:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhLOW1y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhLOW1w (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:52 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6F7C061401
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso26726743otj.1
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NwUvxEHLKrDSolFxTWG/WGpNg3gCnmJHq3/Wqr5qHB8=;
        b=Nz1p4rNYMSm2m+0tyBbmuTxodnsB6hf1MMRjozccr5LflM3ROlpaelQAcCBemFU9T1
         hLNL+3sNHjWtsX3GZcxNh2jCGiIWMImZvYnRfoNk7UOUcmuVB1xTNfoa3qGDUojA1kk0
         5FarN/LgVXQYqx0hJ5sluT58dgmxniK6aj2GghAzrw+7ksc0qlhfCJMeqGc9xW2Xub88
         7AzRzYFNJRM5ejJTzhUFG9RDxYBmVi4LSNc+uPEkuXHl2Ub9WNDfm+2CygpplgkCQkYE
         EihmltkMQeNkBoOc3tPt5Nuvqr8BT4MJKeaLdU3VkKTSiJ6lmpKwhegluyG0UOwXAaNn
         NorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NwUvxEHLKrDSolFxTWG/WGpNg3gCnmJHq3/Wqr5qHB8=;
        b=N/GQnpXaqhwsC5x4mKY9+6t3TyN9wtxO8lq72jnId/5GQYVWq+UAli1lukSsBo/FKo
         I2qmOoOAvFET6q0DTmFt7d4qYZiTIk582nqTFxIMkOAPVXslWVANP7YliiFxyyZYQUWh
         G2uZ0vJxMzpzoP8kXEQ/LTkR+W6hEX8fqoCDxjLXKuALA2+3vM6VYL2s3zhB5YYFdVb/
         fYfm2ROTxxxW5ryKl8nFJpuZ0kxIkD6K2zwJXeCg/TZUhje61bxiHAwqBxjh69SvnOfb
         bLMmlHH4g5FS10gxeSwSXQTcDJt1ARg5ow1LF+vcABWrffVXjo80pJbvHWxmZpOEZgar
         4myw==
X-Gm-Message-State: AOAM532NlcgyJtmpxXwxRokMLLc5fd1iTQwn1MdXEgwwC3HRaPwmYsS0
        HDo8VzL1Eze8W3zaArgHXJt2dQ==
X-Google-Smtp-Source: ABdhPJxEPv32e4bV/5S1vxVQvv0lb10hgyL7Tv5s8IgTQceLaNKMaPbF757eEcMfl1AMJTa2lHcIEg==
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr10316395ota.355.1639607271410;
        Wed, 15 Dec 2021 14:27:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Julian Ribbeck <julian.ribbeck@gmx.de>
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)
Date:   Wed, 15 Dec 2021 16:27:23 -0600
Message-Id: <163960723734.3062250.12078964213468371215.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211116200734.73920-1-julian.ribbeck@gmx.de>
References: <20211116200734.73920-1-julian.ribbeck@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 16 Nov 2021 21:07:34 +0100, Julian Ribbeck wrote:
> Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of the
> other MSM8916 devices, especially the Samsung ones.
> 
> With this patch initial support for the following is added:
>   - eMMC/SD card
>   - Buttons
>   - USB (although no suiting MUIC driver currently)
>   - UART (untested for lack of equipment)
>   - WiFi/Bluetooth (WCNSS)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)
      commit: bd943653b10dc9df63ad6cb69f520c10f3f21372

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
