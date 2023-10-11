Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E03BCDB476
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 18:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjJKS0N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbjJKS0M (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 14:26:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045E9B8
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 11:26:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50336768615so251171e87.0
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 11:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697048768; x=1697653568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhaMMjUnOGS0snHYgCTJqAmCtSDPr4g2Spu2v7RzFSs=;
        b=pOajQnojjdMb1a5mZZN4VIeggGqvq+Z6aRZbtGzbmawN4rONbvAQdhBnsROfAEwkNk
         HFpxEsQgaUZSV8RZPnj/eQEmRvBtSXApMKT44t65zCSiFObq9c950xTHLsy2Cxls6/2w
         /JChni43UDj+m/HrPW+qRIPuMDl9E4obPpbBLsAZxH878MiG2Sm9uuhmqWEj9JFqjQfH
         d2kaHgKHPyt5u4CWTKIJlOEWudnHHHEp/F9b3SqA/ps2fKDPxRGMi3vzpaiGWo0ZKmtc
         +MPEu8X66qW79UUyp+Z0r4XXMjaBgZKZsRQf4dwM79OV7mizHOr4w+qPrzws1L+CUZlR
         CO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048768; x=1697653568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhaMMjUnOGS0snHYgCTJqAmCtSDPr4g2Spu2v7RzFSs=;
        b=L+VBmDHItiB1IpqnPb/OlWE0wwGUCsHeGYxJRwKzV+HoVjOi/GamnmyMUSGfy3cOsk
         XrT/CpzuLB42wh/ZPCoDtNkGkWa3eWKGah3SFFi9yY4CLps2yN13Hpd6ObR117M4stcP
         dICFLdSfdEMXbDWtP6blSfjAQ9EOFfJVUVXKJKxp/dRi+f1sezgGzukfQ2ps4GVZz+cJ
         Rh7D8Ufj/k0aqFRIK1oqtDVQBQ/+FFw9mK/S1Wo8mvGsExW+vSle9f3MH4niwcUXAsNG
         xUOcJkv4AsHDqt4UWWovxaANSnYGl8UeK37AzlNce5cLAv89uVb+I1ElSEAXvLCbwu2L
         kZzw==
X-Gm-Message-State: AOJu0Yzd2BJTWumyPibKkdr7XfNq7u/UuFVYF0hG0j3b1Ah/VIpdOIe9
        a2DYg0R5ztOTyIifumzCZmfCxQ==
X-Google-Smtp-Source: AGHT+IFIQJKuaflQSrmmNd4avkHuLSJlTQxyhkmlvVp6ZFvXYbsrbTPzUobPhnyafRwU98QeWKTaCQ==
X-Received: by 2002:a19:6414:0:b0:4fb:8435:3efc with SMTP id y20-20020a196414000000b004fb84353efcmr16377878lfb.16.1697048768272;
        Wed, 11 Oct 2023 11:26:08 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z10-20020ac24f8a000000b004fe2de20d88sm2372674lfs.232.2023.10.11.11.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 11:26:07 -0700 (PDT)
Message-ID: <67a76151-30ab-4e85-9dfc-0078a83d8830@linaro.org>
Date:   Wed, 11 Oct 2023 20:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: document HTC
 Corporation
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20231011-htc-memul-v1-0-76e57873190c@z3ntu.xyz>
 <20231011-htc-memul-v1-1-76e57873190c@z3ntu.xyz>
 <9f270d15-6705-4392-b2cf-49edf5bc2d3b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <9f270d15-6705-4392-b2cf-49edf5bc2d3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/11/23 20:24, Krzysztof Kozlowski wrote:
> On 11/10/2023 19:02, Luca Weiss wrote:
>> Add the vendor prefix for HTC (https://www.htc.com/).
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
> 
> So it is the first HTC device in upstream? That's a surprise...
Same feeling, this was very unexpected!

Konrad
