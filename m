Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05098C43217
	for <phone-devel@archiver.kernel.org>; Sat, 20 Nov 2021 23:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbhKTX7X (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 20 Nov 2021 18:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237909AbhKTX7F (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 20 Nov 2021 18:59:05 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BC5C06174A
        for <phone-devel@vger.kernel.org>; Sat, 20 Nov 2021 15:56:01 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso22795648otj.1
        for <phone-devel@vger.kernel.org>; Sat, 20 Nov 2021 15:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oneb1hKp0lFWOX5v5oZbk6wneKKrR0B0PdK+V3ABzpo=;
        b=U5v9gHcwNZ5RuO8zJCQ3TytNbJTBDZyuQt/5GpxE2Zf6YT1mJGyQ+I3t8O30/COGTH
         Tn0xcm/L+rJoneux0C6WJpPiTk+g0TzBm0iHSNz16P3s9yrvVN6j8Qpf+BzpBDjX29UE
         IgMowxU65TBwwrY9j1nzKU5pXnWwcPWuQZz0VHTNXB9AdJ53YPXWMV/WxIiRlYgPFEIl
         DbxP0OfcsNF51Eqca5tG9WHbZI9XR7nkkJWZ3QxOopATuucuoj85CcnugbhsQZ+P1GJ2
         mQHU/0o32NwNxHbwoFYrMFO/1sQH9kVnYtaWbQgeYjlZvInTshsyu1V6AJAInk9yDUcr
         IUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oneb1hKp0lFWOX5v5oZbk6wneKKrR0B0PdK+V3ABzpo=;
        b=RrdkeNowegLYKXE4cAKQcCD766WJbfmvM8LigRthMu5jgME7SyFXwbswtfilml4rr6
         H1XlV5G7axoDKmcxYI6FlkVBtPeh2XqA3ohlfvxgu6WutTAU0fF42BdozWNPomUYl8dC
         2Gc1Mq/wpAYfga9KAVUp0TFewD82aEFi38sig3GXyc7tpFXMkVhBpFvQCpesevsqcMwc
         PFGoGBUCIIQWQxx2ea7Wnmh1FkPqq0YyPhP8LGeI3eHK7q59hiWxF1iCrqoArm2z+2nl
         etM6Iyqu7FVP5VAvF7StjzTkftfJnP9xkrb/LoCUJdV0zP9hD23ByZvY8powucR4E4FD
         4wtA==
X-Gm-Message-State: AOAM5307sgoQij8ye6Me9J6jqbWLk2/HYvnnF1Jar4InMtVl86oK595T
        JIcQX8NzcVsZ/DVZyGn2Ll01mA==
X-Google-Smtp-Source: ABdhPJyzO56USOVpnl5Kq/wCMruIYH+GSnllfOzIxAfu5zzFkn/QpIuoaBkA9zsi8KSG83iPMhrpjg==
X-Received: by 2002:a9d:758e:: with SMTP id s14mr14866966otk.218.1637452560985;
        Sat, 20 Nov 2021 15:56:00 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:56:00 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8996-xiaomi-scorpio: Add touchkey controller
Date:   Sat, 20 Nov 2021 17:55:37 -0600
Message-Id: <163745250541.1078332.16821904552266137859.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104104932.104046-1-y.oudjana@protonmail.com>
References: <20211104104932.104046-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 04 Nov 2021 10:49:58 +0000, Yassine Oudjana wrote:
> Add a node and pin states for Cypress StreetFighter touchkey
> controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-xiaomi-scorpio: Add touchkey controller
      commit: 25fdaae63a6927efad2f6c0428622712f0eb20dd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
