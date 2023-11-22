Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DDBC27C40
	for <phone-devel@archiver.kernel.org>; Wed, 22 Nov 2023 20:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjKVUD6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Nov 2023 15:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbjKVUD5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Nov 2023 15:03:57 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7632418E
        for <phone-devel@vger.kernel.org>; Wed, 22 Nov 2023 12:03:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507bd19eac8so140413e87.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Nov 2023 12:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683432; x=1701288232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Io/gjQ08AuDbFAY0fMf9d/V1TR/FZrGyaBoM54Wv8Dg=;
        b=zWD4RCs5NskLi+UE+EVMUMu5jlQmQP6K7m3XpDfIQRP9NeqpUhu6viK9B+ISp5I+tU
         Qa1WQeqaUAW7jUnw0MF2UtFseCh7VuYGVg1aRtRCth91d89TMmBFqk5KpLbkI150Vhaj
         Dp2uTS8UTXKcbXboZTj76d0rlpKT9qwQEp4VNNJHhpQOHSBN2yjqiJQQu+6DEg+pCPdb
         gfGKJTX+a/FugNyewoqDHBmORDQVT0El7r2ESZg3e5LaEFHPRnS4lsarmXRNlQDFWFA/
         n68REdwg91HJ7lZl+xNtnSBe0+9Pis5CUan4qyiKUOy2TsdHnrEzA7Am/zsPP5SxihmL
         7O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683432; x=1701288232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Io/gjQ08AuDbFAY0fMf9d/V1TR/FZrGyaBoM54Wv8Dg=;
        b=QD/Wi6CKedneg53PXtj9Lcp3v8KKNuUJxoa3XL/23FVmeAgRGdcJBPoszraM9IibBv
         RPq30Gb2nuOa/YldUfWNN3jPUFc6HQQIj6InE8WtRzXzaf1EfNV8U1h7e8dTRP4/AJca
         BBi4BX66N8nA0LYDX7nSnaoNaUB/nVVNLeiR3myZJf/WVBU+hjkfTjbzwFoDV7mgzbh5
         VnsKEWYcqQru1vpA7PYXF57SMHiCbalzTJtza8tQMN1VhKOs7BkwH1Sf/EMzXsCeH4tl
         BQioZRDM+kZF/Kd30ndRzB6+BMjOpeIpK+wKN3Uzfo0XV6eKiSo/DKLrv+ma3Fs9Qg9q
         e0ng==
X-Gm-Message-State: AOJu0Ywh+HhZsyTpNatgpejcaPjCJgQeVJssd9iOod8F9gz9k+5xORZr
        ws8oTceq7eBtmO7Y1NlcauPQhw==
X-Google-Smtp-Source: AGHT+IHz/4Br/9+seo/Lrak4kInlCaTk0gNCYlhXMZj9w9gtMMfU7nZufobL54nVG+7FpfSZWSIVJg==
X-Received: by 2002:a19:c511:0:b0:509:e5a4:2af2 with SMTP id w17-20020a19c511000000b00509e5a42af2mr2294279lfe.49.1700683431515;
        Wed, 22 Nov 2023 12:03:51 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z15-20020ac2418f000000b005079ff02b36sm1932808lfh.131.2023.11.22.12.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:03:51 -0800 (PST)
Message-ID: <1bb81371-e829-4e02-a234-02f84433f4bf@linaro.org>
Date:   Wed, 22 Nov 2023 21:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: qcom: qmp-ufs: Add SC7180 support
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Joe Mason <buddyjojo06@outlook.com>, hexdump0815@googlemail.com
Cc:     cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20231117201720.298422-1-davidwronek@gmail.com>
 <20231117201720.298422-6-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231117201720.298422-6-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 11/17/23 21:08, David Wronek wrote:
> The SC7180 UFS PHY is identical to the one found on SM7150. Add a
> compatible for it.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
Should it not reuse the 7150 compatible as a fallback then?

Konrad
