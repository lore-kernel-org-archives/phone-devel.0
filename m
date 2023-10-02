Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70F7E784AF
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbjJBJOo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 05:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235931AbjJBJOn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 05:14:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BBC83
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 02:14:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50308217223so24748952e87.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 02:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238078; x=1696842878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hegxgNO6/eJmMi3xYv5xPqS6nCUbQPuKqJAOsVw9YZU=;
        b=exODTJckfjOSaiP0BD1SXvH0KxA+TQrsM2Rjzu+cjpjTmb5f3S46nXUzjzQAFoVfMr
         roPw3hrJN1P7VrOjTQ5pDeprwdI4PumNichevxqtioAPKeIFCuTMm6td/o7lZctdHRJg
         GNg/dHhvn819wXHNIQ8KttSgeWG6q7wwy5apTx7BKQWyTM768XU800qJNmoIxX8Ka1xy
         rnNpNMvsfSmtKiF/ZeLqVHLivmTVrx5IHOyqJNlirbmgTAQSbfpXXVg6ItkEFb2P6gbV
         mOwXOK6NfwNMPfORUybfYFVjOGPscuzUnWxlMXJn/ZF77/2iMseuHBbb4m3NN0cPm79r
         Ncbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238078; x=1696842878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hegxgNO6/eJmMi3xYv5xPqS6nCUbQPuKqJAOsVw9YZU=;
        b=QLKsq5LNdmTp9KGaWyJcb+TQ+Mipqh+uHirMwY4jvvIftvNMEXKYl3vmEcmxLK0Yyx
         t+3Y8jOqcf6oJ9cL/vJzYZ4hlWKPwi/ivsmlXY0xKQ1TWP/5OrzsU/34U0FkCiYw0Tk5
         WfmwGhnEuPVkQnizWjCEOx/T6/h0OlLCEumzIHfmo9oLWEJUVZw9seUlYFLnUUlu52/3
         G0ar0cQCmWWXWadaPQUKYGxCKG3Qi/62YcDZcZrQBd0hNzAhK4rsfUOTHBbquDNbAFLz
         F1KiEL+Nf6zUQ3wzUjvochiw9mDmSH0GLtovbOJjFq/Ms77Ze3O2eh5IoXv6+xBpdCBg
         zGCw==
X-Gm-Message-State: AOJu0YxUpq78awVIgtoBDzFBwR67FFggkd+GnGvf6frGE6/ix1BKHNzE
        zMBm1tD19y2u9tpRfGe1TcgWoQ==
X-Google-Smtp-Source: AGHT+IHhbJ4Zq+s+rSs8FNu7KDcaBBB/nMuvHKF9xaETSqN4qzFpE0HCxDNLu5zink+hPe+tNdEDjA==
X-Received: by 2002:a05:6512:693:b0:4ff:7e80:4f1d with SMTP id t19-20020a056512069300b004ff7e804f1dmr11149698lfe.57.1696238078052;
        Mon, 02 Oct 2023 02:14:38 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j5-20020a05651231c500b0050482d4727fsm2210852lfe.233.2023.10.02.02.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:14:37 -0700 (PDT)
Message-ID: <3267eb4b-7154-200a-ec10-d795acc029f1@linaro.org>
Date:   Mon, 2 Oct 2023 11:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230929-fp5-ufs-v1-1-122941e28b06@fairphone.com>
 <cac1b912-e08b-4643-b081-834fdee30ea7@linaro.org>
 <CVXREP4FCX4E.3M77P8JP1T27M@otso>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CVXREP4FCX4E.3M77P8JP1T27M@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/2/23 09:02, Luca Weiss wrote:
> On Fri Sep 29, 2023 at 3:12 PM CEST, Konrad Dybcio wrote:
>> On 29.09.2023 11:52, Luca Weiss wrote:
>>> Enable the UFS phy and controller so that we can access the internal
>>> storage of the phone.
>>>
>>> At the same time we need to bump the minimum voltage used for UFS VCC,
>>> otherwise it doesn't initialize properly. The new range is taken from
>>> the vcc-voltage-level property downstream.
>>>
>>> See also the following link for more information about the VCCQ/VCCQ2:
>>> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/1590a3739e7dc29d2597307881553236d492f188/fp5/yupik-idp-pm7250b.dtsi#207
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> I'm not 100% convinced about the regulator range change. For sure with
>>> the original voltage range the UFS fails to initialize, but looking at
>>> downstream kernel during runtime (debugfs) we see the VCC voltage
>>> switches between 2.4V (idle?) and 2.952V (active?). But even with this
>>> change in mainline the regulator would always stay at 2.504V which is
>>> for sure lower than the downstream operating voltage of 2.952V. Behavior
>>> wise I don't see a difference between ~2.5V and ~2.9V.
>>>
>>> Should I just constrain the regulator here to min=max=2.952V? Or just
>>> say it's okay as-is?
>>>
>>> Depends on: https://lore.kernel.org/linux-arm-msm/20230927081858.15961-1-quic_nitirawa@quicinc.com/
>>> ---
>> There's a little funny hack inside the driver
>>
>> #if defined(CONFIG_SCSI_UFSHCD_QTI)
>>                          if (vreg->low_voltage_sup && !vreg->low_voltage_active && on)
>>                                  min_uV = vreg->max_uV;
>> #endif
>>
>> so, when the ufs is in use, it's pinned to vmax
> 
> Hi Konrad,
> 
> Are you implying I *should* or *should not* pin the voltage range to
> 2.952V-2.952V for mainline?
Neither, voltage scaling should be implemented :P

But for now, pinning it to 2.952 const is the right temporary
solution, as having working UFS is generally better than one
that can only idle in a stable manner :D

Konrad
