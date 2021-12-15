Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41BCC433EF
	for <phone-devel@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhLOW2F (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:28:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhLOW15 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:57 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB36C06173F
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:56 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26660893otj.11
        for <phone-devel@vger.kernel.org>; Wed, 15 Dec 2021 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1jaFOJRzdq3x9WzOCPWbxi4lln7eUG+9jlUAXo/NCI=;
        b=lo+9tihPQ4PhqEiFwq0qhpbo4eIrKXPODpS30ASYysmOveR9nd43OjgGvg6z/BSYKR
         c8TSbiBdRcPx7rfW4BTrghAMOW0XF4oOZCzHOIob5+rD6kMT/8kufClTPM3AjRPfjZvd
         WhqjUuDh0TeoEQlYEk05cdAG2X2k6PetRowBpMk4HQCoIP2rcYcQLzFwpxsh2vp8iWOe
         0tjFq8fzpJCEleI69IfEXEddKycfjDOIg+Mxlae0zbUJBKbU0rOtWvSmeG16wCXVig0B
         Oa+U4Z4/IB1lNnCBZdZpA/qil9FDPj7DH+H3lnLkQkuATLn1EFpmoVpNUS/aLit+nRnt
         UiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1jaFOJRzdq3x9WzOCPWbxi4lln7eUG+9jlUAXo/NCI=;
        b=m042YT120Wyf56yJaD/bMWKMUjzaUltgiWU26Y3yVYC0L4TrJOl+zv0BXI1LcYMpPO
         XEoBUWv4tXUCC3I2/ISHg5lmyz+xOw9gEn53qxqLKnDqML6/8g2q4LP/y0nuCL0SiIK1
         ivLr6/mEhVr4uut5Yuf4NPwqPSiUtw229wjjkKx6lHkCXt7ArB9FY255aWO3apEddyLh
         tRNXje0IgL1FM0xPNzZ0gvUrZX0h40b7I4BTqeubAUPXpB8TLeqvIJZExismxc9x64oe
         s3RXGjWYXDt3fws8O4jb7E5RogWvd1irIxPBy3FSmTsHPBSbfXKpKXWsW/MILes5ZRBq
         NNBA==
X-Gm-Message-State: AOAM530iQXzvb+V+EKSiq+9uygrEjj5tiEGcgRnT94i0kWtQ72JYJ4bx
        YiwEr4n4EIx6vThPusT9EwuzDg==
X-Google-Smtp-Source: ABdhPJzaK0xufB8+lzhrMyUZal/R+F3V5OC6jZ5SDnHg0B2uLuAKczygLZBP3B/g5dZojbNfyCiuFQ==
X-Received: by 2002:a05:6830:232e:: with SMTP id q14mr10689326otg.133.1639607276106;
        Wed, 15 Dec 2021 14:27:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:55 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] soc: qcom: socinfo: Add SM6350 and SM7225
Date:   Wed, 15 Dec 2021 16:27:28 -0600
Message-Id: <163960723734.3062250.3076248613827283388.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213081111.20217-1-luca.weiss@fairphone.com>
References: <20211213081111.20217-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 13 Dec 2021 09:11:11 +0100, Luca Weiss wrote:
> Both SoCs are known as 'lagoon' downstream. Add their ids to the socinfo
> driver.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add SM6350 and SM7225
      commit: 22e8f8dcb7a88f2167607a52542f2f1bb6f53559

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
