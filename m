Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051DCC4332F
	for <phone-devel@archiver.kernel.org>; Sat, 10 Dec 2022 11:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLJLCS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 10 Dec 2022 06:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiLJLCQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 10 Dec 2022 06:02:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F7A1C90F
        for <phone-devel@vger.kernel.org>; Sat, 10 Dec 2022 03:02:07 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p8so10901099lfu.11
        for <phone-devel@vger.kernel.org>; Sat, 10 Dec 2022 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bTQZJ5qEXOwGkELkieaUGAk7eqOZjN88QdCoaf1buM=;
        b=mVthSDKGO9Fp64BbysCFZZ8NHo7bkNmayJWB1ZQNafazjPDLin4oyHJdBzUo7TRncH
         p+vcbYCknJGSuGvUsim2mVI64xyo3qx07jeXIz9AH5TgB7jKwoALs+kA8AQLthJgEWhQ
         +TR4J7W/qWLgApi4cKOzRwiJY9UkID0Mkn5dJwD6Gxw7iNT9kGd5jbOGPuiwwxGk56Ek
         shiM41vE6hcXZEOCI4+ZBqWretC5K/1lofDJkXUtT0k5T28EQYxwKrH2aCeT0WI1Kz3y
         DvDgzklLbel0rLpk6RojNc1gQR4D6dT/ISQYlJ0kYAhzS4TYmFFhArz2uAlP61EaZ8jj
         GwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bTQZJ5qEXOwGkELkieaUGAk7eqOZjN88QdCoaf1buM=;
        b=g8z8RPiKQ0o4lK4RNYhxmSNYnQ/6yG+zbsCXs141BBKWZVMym7t3B6E5U3sJY/qHzL
         t28gXS/l8MnEJnEcDtly27leKblKVocZeazj9sCq8HQ3YqJrtu/Q80uWMAeEbN4e8976
         i507drbZKO+gUeeuY9oORHnlDDA20Le3MpAvPMLR8rPJo7MOKYyCeDL1IX9rGb3pnkae
         AEXNr8CSfCwp4FHXEmTCNsz1PLTMG/iaQs6vPva6inc6nY58hq6AphftY142C1upZffe
         O6v+RFvrPEfvS960blV/JVgAU3+xDYh46ucSb98rqhJmlPTDuVWVvwbmRpfORmK5ag/a
         F9QA==
X-Gm-Message-State: ANoB5pluFzcTQaXZVSpyLhHu3eMooNk3kzNRWd8+jCaLIbsfKHsmyI+l
        lja0mooYFHnDn/mR59DIhhhFPQ==
X-Google-Smtp-Source: AA0mqf7AQrGsfQSJP95snYMsi5ihiDRduio3adT9wGO6RWhqO5O1QKE2e79DDmRrxDuEsRizInTNGw==
X-Received: by 2002:a05:6512:6d1:b0:4aa:c6ac:c356 with SMTP id u17-20020a05651206d100b004aac6acc356mr3343916lff.26.1670670125426;
        Sat, 10 Dec 2022 03:02:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l11-20020ac24a8b000000b004a8b9c68735sm671534lfp.102.2022.12.10.03.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 03:02:04 -0800 (PST)
Message-ID: <3d5b29f3-8d8d-93a7-a485-5261e2d8891d@linaro.org>
Date:   Sat, 10 Dec 2022 12:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH] arm64: dts: qcom: Use labels with generic node names
 for ADC channels
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209215308.1781047-1-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209215308.1781047-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/12/2022 22:53, Marijn Suijten wrote:
> As discussed in [1] the DT should use labels to describe ADC channels,
> with generic node names, since the IIO drivers now moved to the fwnode
> API where node names include the `@xx` address suffix.
> 
> Especially for the ADC5 driver that uses extend_name - which cannot be
> removed for compatibility reasons - this results in sysfs files with the
> @xx name that wasn't previously present, and leads to an unpleasant
> file-browsing experience.
> 
> Also remove all the unused channel labels in pm660.dtsi.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20221106193018.270106-1-marijn.suijten@somainline.org/T/#u
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

The talk was in context of bindings, not about changing all existing
users thus affecting DTS. What's more, to me "skin-temp-thermistor" is
quite generic name, maybe "thermistor" would be more and reflects the
purpose of the node, so it was more or less fine.

Anyway I am against such changes without expressing it in the bindings.

Best regards,
Krzysztof

