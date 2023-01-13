Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CEBC54EBD
	for <phone-devel@archiver.kernel.org>; Fri, 13 Jan 2023 15:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjAMPAZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjAMO7d (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Jan 2023 09:59:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21E89B2B3;
        Fri, 13 Jan 2023 06:49:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 677D0B82169;
        Fri, 13 Jan 2023 14:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A0FC433D2;
        Fri, 13 Jan 2023 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673621382;
        bh=ann4UHg7nPZIZg28zXX2PyiyYio0JDACGv1Ij35hhRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ktgrbjmNXFzOEVLJelmVB8YVnq0xGXs/ELNKgGhwKmsV77VoAjzU5KbMw8QtOb+ez
         ntaw201QJvqUsxQ4UYm8eAvj7jrrGFD5L5iMzqP8+YjbaVt5HizBxe6gvRNa4vsODC
         87G63n4NZ9pCaUD3ciceNxbpZHoQ7lHR3OOp7eks97f7Td9p7USK0K+IER9Imzb8tn
         vQ1GOQAO28sXWOaIfN/cjKnFaRYObGh5y1hG+IvMLoxtY5gvSIsIxIv1ZX1SILXMZ5
         rkUw+aE62kIduXr2ZyLH+hBVqB7T3G1RsGzj/xe3sNhF8yaNcCmZ3n3zMYt9r9gKaP
         o5xkE/KEN+ytw==
Date:   Fri, 13 Jan 2023 14:49:37 +0000
From:   Lee Jones <lee@kernel.org>
To:     Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: mfd: qcom,tcsr: Add compatible for
 MSM8226
Message-ID: <Y8FvgdgAwt6ahBES@google.com>
References: <20230112202612.791455-1-matti.lehtimaki@gmail.com>
 <20230112202612.791455-5-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112202612.791455-5-matti.lehtimaki@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 12 Jan 2023, Matti Lehtimäki wrote:

> Document the qcom,msm8226-tcsr compatible.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
