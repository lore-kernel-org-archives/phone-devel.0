Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383DDC433F5
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 15:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8096127C
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 15:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241643AbhI1Pka (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Sep 2021 11:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241600AbhI1Pka (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Sep 2021 11:40:30 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034FCC061749
        for <phone-devel@vger.kernel.org>; Tue, 28 Sep 2021 08:38:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u22so30447510oie.5
        for <phone-devel@vger.kernel.org>; Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UzVpZWKlJwRxSjuK78I3eEXEjM8AokgYI911F1Dgoog=;
        b=Lh7oxXzq7U5xVayIB8k4MdCaBlpkBo6oslCTe6LgtGxkoYhjvFQRQQo76tCzHSQqNo
         LcDnoDaBX4FYrTGolrUuokUEfpz5hMXbfKsFoY3qlS2o8Fr2LF1O8aBfdp++VwaYYk2j
         JocuHgDSRphkZO+zB0pdJKJ/hDSEkxqyEd0On57iHu1HcWJLu5zfSqZZLgK1nH2KldZJ
         2JEqnXg32m9KwN94R/VzGNb5/xoO7C5zCsV2VxYHK9zK1ljlxIcPRcZc9XDENGoWJ2oS
         OLP+EBd4igDboPbw7LKsZrLUOTF+5kbCqXmuE1IciV/c2pFPuUZDnZ0L2qRhgKBihrfJ
         3leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzVpZWKlJwRxSjuK78I3eEXEjM8AokgYI911F1Dgoog=;
        b=BFbgeREuwedjGuZTLXqtrDPSa4X43GzIduYOstTihxqAq5KDF3O2aHHin9w9g5efGm
         hKTSrZjSRPNx//mh80dwKjTfflCW7I++08Yb27dytFz0A0xTU/4o6KmYfgSGs6oUsj+S
         ufEaJ4QHmLIdDbM5DHcQfTLWN1lFP3kia2XKk6tLd0rjYLNa/mePkz5j1xMi9Y3B3Zbq
         yR8oYK1A5CnqXOBjqb3zKPB7uviXZImt9Sw48DXcO7xd6A/Nz2WXunTVC/r3bh75ezT+
         HzRSPRqKhVfa9SpwR/uDnX2q81J5zUvrtvuhLXeS08UEKESq08JczcaMzXGam0z0ig0w
         3cJA==
X-Gm-Message-State: AOAM530wy7AlYQ4aLFRh6ODLEQ0av08YPvuvwgOHrPRLLuPmVwDZnvyN
        OCdnZt6sJRe6bJ7b4653jfBMtIJmrIrChA==
X-Google-Smtp-Source: ABdhPJzpKI/iHmrF8iGPdIrucU5CqhILBdh66wKx3f4vL1+mlc0e2eWHMpxxhJ22+nE5sf9nrUdarw==
X-Received: by 2002:aca:606:: with SMTP id 6mr4222738oig.82.1632843530129;
        Tue, 28 Sep 2021 08:38:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 18sm4753034otj.10.2021.09.28.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 08:38:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm6125: Improve indentation of multiline properties
Date:   Tue, 28 Sep 2021 10:38:46 -0500
Message-Id: <163284350355.1592203.2999251996289733980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210925141841.407257-1-marijn.suijten@somainline.org>
References: <20210925141841.407257-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, 25 Sep 2021 16:18:41 +0200, Marijn Suijten wrote:
> Some multiline properties (spread out over multiple lines to keep length
> in check) were not indented properly, leading to misalignment with the
> items above.  The DT file is still small enough to address this early in
> the process.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6125: Improve indentation of multiline properties
      commit: 4e31e85759a0622b25a63300019d04ff031c95e0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
