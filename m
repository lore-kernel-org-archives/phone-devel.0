Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E423DC433EF
	for <phone-devel@archiver.kernel.org>; Tue, 15 Feb 2022 12:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbiBOM7w (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 15 Feb 2022 07:59:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236600AbiBOM7t (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 15 Feb 2022 07:59:49 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718EE7F6F9
        for <phone-devel@vger.kernel.org>; Tue, 15 Feb 2022 04:59:39 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u1so18224726wrg.11
        for <phone-devel@vger.kernel.org>; Tue, 15 Feb 2022 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vgVdr55qs8iiMY1rMIglKTHpx/WkJBbTswO6JXL5f0E=;
        b=AL2Ijt1akTuY2Axq7/U0a8JApwjaCQMOc14gM49BL5Ohi1z1nupgWzMpSHAnyAsDaP
         VZ+rAVFRsPblaoCFTJzs92dXsMVR49gG2kbXC84FSAEOo5q/vWQVyIg70/0T8y65GRTx
         iN3/WQY9sc8LQNDxrJf3FzVEODqYumTSo1ff2xKSJ42Cq7WR9ueZnLoCthZgAmpND4iG
         rrlLPe9IA4VFgDXXQQ7UdauR2tdReHaWNY4MDhrqsRSoscm3sEwbqC3cjw9p0M0YYKO9
         QdD8+3eFrJA32eNmf07UoihsqpEUr/oXFLKwyug0ys8h3gP1fqvO7i9JMkxtOiDbJmnL
         fhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vgVdr55qs8iiMY1rMIglKTHpx/WkJBbTswO6JXL5f0E=;
        b=xnuRkBXmqWyCDUxNnf+4lJhlkl+v2o03Q28RZuttfTRaomBV+CJkRtEKaCVczZS68M
         zK2c7781crPg19eR7BfuT8+zkksyymI7mZAQgDvyT2dZvmSMauYfH1i0tgsYl3MpfueH
         X84605LI6/Eqp9gG5TxC9x2IoSSAajYtlaJ8xsMXlRN34ix4qtN8JXOQKtJtmH9XT+F+
         lIwAVNIdstvB0n3QqB1cCWWEp68BRMlg0x/typcaxL2IftqnmNRZGLYfoG/NTUMWj+L9
         UjVOu8QpjWwRHZYcop7qpBB43MTFDvxfFi5k1U0cLbAeQhskvxSBZWeBvDeNr+7dvpf1
         dRsA==
X-Gm-Message-State: AOAM530cYLKRfW1TuPH8Bu8RlVo8bHLUYmCB7eoY+Oqw7fGJFSaUoLgs
        d3A/cgLj/62Uv35jwwdMACI3DA==
X-Google-Smtp-Source: ABdhPJz2N14OPH+RuT8qy2PgXqqyA9+52lT1MuLV3QbvF/pUZLCpW+TA6k6z+rkdC2Lx8SeboTlj9A==
X-Received: by 2002:adf:f241:: with SMTP id b1mr3109444wrp.444.1644929978059;
        Tue, 15 Feb 2022 04:59:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id s7sm3538160wro.104.2022.02.15.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 04:59:37 -0800 (PST)
Date:   Tue, 15 Feb 2022 12:59:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/15] mfd: qcom-spmi-pmic: Add pm8953 compatible
Message-ID: <Ygujt64b4PBBeBm1@google.com>
References: <20220112194118.178026-1-luca@z3ntu.xyz>
 <20220112194118.178026-5-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220112194118.178026-5-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 12 Jan 2022, Luca Weiss wrote:

> Document the compatible for pm8953 as found in msm8953.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
