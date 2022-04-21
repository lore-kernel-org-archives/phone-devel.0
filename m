Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B385C4167B
	for <phone-devel@archiver.kernel.org>; Thu, 21 Apr 2022 14:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389306AbiDUOa2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Apr 2022 10:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389308AbiDUOaU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:20 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E103EB90
        for <phone-devel@vger.kernel.org>; Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id e189so5757399oia.8
        for <phone-devel@vger.kernel.org>; Thu, 21 Apr 2022 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Y+rGBJub4hUelqG6Wh/GRTU8FsHwDE9p9sZ9nEoVKQ=;
        b=i8Jw5blRNpNTEopLw35Y+TQC2A2+Nrm9Hwa8Jp4lGm9FN73TIJiwgUuEtHVw7BwA/k
         pdHr6K4ZAqp+eck+SqZkrX7w9Xkvmn//IUxnGY4NMunZRWKf9VmHwiDS9IrndGfJYGTV
         sEQUUT+ycI/iBAez7xuA1bR6uECYMdeKAty07R7HiTkUk4K7iBrWu2PCPVHt9thRYj14
         FxdmcqVlO0mWT0Fsey71UPB0083xxV+I8GI6dLygQmGXieIfXC7U5SPwA8wwFeqcnO1i
         MR9yBMVKD4xiCD+/mELhhSfilMNfQejDwP193E9Or1ZoNxWmSNhPFpHpCkfOuDYFx0pt
         1tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y+rGBJub4hUelqG6Wh/GRTU8FsHwDE9p9sZ9nEoVKQ=;
        b=lvfSS/ze9KmBLxKySYfcn5+UCCa/pgLgwneMSI0No0z4jA7i0te1eD3MPCrN4PWj/8
         F/3fevZoHwuPAfhitUK2y2LP1SnjU/UXhiBFTB85z5e863EL+yzHi4/Rs2udZ9kTQrdV
         HXzW+nK0OmhPLuSRbV7gbIng3iWr+8erzXIVXFObP3hJZIxtiDrbA7bzEaSR6voCmecZ
         7JhAVCvlajm+m5YAEx0+djcUjx+adRdzjvLdG1kqwYHE4mhBxnKWM1C4YYkoDT4R+npO
         roBaS94Bi6DrGOfWAsySZCRlH7H1L2FyXcyPOvM/SAhaTPwOUEfgjLxGv5PZEzZaCdGg
         op3w==
X-Gm-Message-State: AOAM532+84CypqLTyVR/ZzjY6cVjVUTlm5G2IBck49iqnmi3bXjQuuT9
        ib+NHnIHPe/Hbgf4I+vtxjh5Xg==
X-Google-Smtp-Source: ABdhPJz+s/MnXFjAWX/wh2CCqvIrZgal3PVDIV6DOYifyt8dsIAkB6QhDTzoqVpGUZrI+GfQdsiTLA==
X-Received: by 2002:a05:6808:2189:b0:322:e874:e8f2 with SMTP id be9-20020a056808218900b00322e874e8f2mr3632255oib.289.1650551246360;
        Thu, 21 Apr 2022 07:27:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] soc: qcom: socinfo: Sort out 8974PRO names
Date:   Thu, 21 Apr 2022 09:27:02 -0500
Message-Id: <165055095990.2574292.14922414539179554766.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415195449.617040-1-luca@z3ntu.xyz>
References: <20220415195449.617040-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 15 Apr 2022 21:54:49 +0200, Luca Weiss wrote:
> MSM8974PRO is commonly used for referring to Snapdragon 801, compared to
> MSM8974 which is Snapdragon 800.
> 
> The Snapdragon 801 has three variants with different clock speeds, with
> the -AA, -AB and -AC suffix.
> 
> Adjust the names in socinfo to reflect this.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: socinfo: Sort out 8974PRO names
      commit: a555b382e7640b80b20816cf9179d091dd7716eb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
