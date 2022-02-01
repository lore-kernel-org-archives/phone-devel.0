Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17190C433EF
	for <phone-devel@archiver.kernel.org>; Tue,  1 Feb 2022 05:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiBAFXA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 1 Feb 2022 00:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234316AbiBAFU7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 1 Feb 2022 00:20:59 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46758C061778
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 21:20:50 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id q14-20020a05683022ce00b005a6162a1620so2403195otc.0
        for <phone-devel@vger.kernel.org>; Mon, 31 Jan 2022 21:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WzLZQ6lqZkdpbMj57Uomypo+FFPWINPWh+G9g9l2vFk=;
        b=wH3sVAxrtlabEH9t+p8eycVZyRMffqonXWKa9TB17eplnIXin7L8SrU8q5bDfUwMc0
         VNi9kyXXXdA+W0cxzVu1lGdOx9f4jG1P8GVlIq64raPUWQDlHZUxzksxBdLwVwchUyBt
         NshsUmCwZQz8WPW4PGx79uJp8H2O5q7SlCqK5PWRDE2GOck1dfL+i4Y3hOSYmk6yUBdl
         2hvg38PSQcE2YFOd5WIY9XucqnRETRvLv74z1BNQMAUu4MtN5Oz3u/i5R0ry482zraaQ
         PJpJKfQ97sBcfOoLTjRGDVRUSQl1kL1mZ31zSUYiusicx6To1PIgHiEQrcr6pYVKsFkF
         +qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WzLZQ6lqZkdpbMj57Uomypo+FFPWINPWh+G9g9l2vFk=;
        b=RYtKzhltOIRVCxUKA9Mg8eciWNZ0n1qxpBM04sfht8XXxLlyHlgd8/DaRnsntf/jWD
         1knh2OvIVWOzXd2MkOCYuKLCIW12/0Ojc8pjCT6GWlUO71RrZ1xrxxFtpOp7KzHJ6LLE
         E073Axe4CtdA/npUrJjMlrSqnxCHhDwnc1+ULV2rxgKoArxA724TRlHSMQRnUZp/+9Up
         eiwCyCyXW1XiVzgcbDRi/LsXFP/fB3+KHSdpFTxJX06COgnJeeXYCdQXc2ugz6b40lVO
         DtJmJQ2Y/4baEz3D1hQ7hqYcxKoosPWwWW8RDqQVvntXSMzdzzFqKqnAC3PG+xOVXUNt
         A/zw==
X-Gm-Message-State: AOAM532gdl9lbUNeeKD9YTPwG7ES13CK+VpKavR1x4RL0JK+K5vvJ161
        SerHIsvjqQ6AmeX9eVj8Uw1WeA==
X-Google-Smtp-Source: ABdhPJyYpaWYOdpJeH3gASdDGJTJNMiU1xS4VylhMyKAKho/YJs1MxaV3JBb8NXCXcH8iicocUwoaw==
X-Received: by 2002:a05:6830:1204:: with SMTP id r4mr11445595otp.32.1643692849683;
        Mon, 31 Jan 2022 21:20:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:49 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Rayyan Ansari <rayyan@ansari.sh>
Cc:     Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 3/3] ARM: dts: qcom: pm8226: Add node for the MPP
Date:   Mon, 31 Jan 2022 23:19:59 -0600
Message-Id: <164369277345.3095904.948418340291861432.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171538.18088-3-rayyan@ansari.sh>
References: <20220124171538.18088-1-rayyan@ansari.sh> <20220124171538.18088-3-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 24 Jan 2022 17:15:38 +0000, Rayyan Ansari wrote:
> The PM8226 provides 8 Multi-Purpose Pins (or MPPs for short).
> Add a node to support them.
> 
> 

Applied, thanks!

[3/3] ARM: dts: qcom: pm8226: Add node for the MPP
      commit: 5fbd593756be9a0ee710b15e14d2797bfbca108f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
