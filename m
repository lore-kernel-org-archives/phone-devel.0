Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09872C21F7
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213801; cv=none; b=ChWgYQtTUDXEEhGgWsxMI12Nc5I5bDc2OZlHSciJqZRPqowxjV2TRwWHSAOg7B+8pNWiL1dNDnWRmFV6jjULpi9bE03JGULjD8QfOmYKKAMcmJfZO1vA0G1wc3rhMnSNo2rPbFb0czXe/i2Y42ThNcWA9b6tH8kdIgLwNyEA2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213801; c=relaxed/simple;
	bh=zxYqm0zQueh0U0yDRbTPD4QtsJ7Bx27wmqHwL5z/+7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oz6wkwIJstBBFIdIQsUL6SyfiiJb/SAixsszWFfjh3oRNUNvtw72bCkGIw6hAcVpSnDZEjm9b4K1Y8fSP0Vu0TfgBGkuqhyofSYLHFRIcSLHcoEy0Vhne/abgNIjS7vDoOULBnNBxdRcp4OGii9wecDgQ1dwXe9KqWGEJ1Uk2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKcniPiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu4u0C4a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKcniPiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu4u0C4a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84L8l3057612
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxMVnP7klhF7zuicFFjZTjp3gwEJfISaysxyhwsH6zU=; b=mKcniPiCqKedrd1a
	ZUavt6rBtOP9PeRqG2qVS49oIRhL6AIthCiVoVjr8f2DbNgTRdVTW0+4NdwzwiTz
	mFnrtTo4ozC736ydacctG+gIxMusfsYN3gmym7B6h/Mv4BJJNTfl7NMK72cPBA/D
	lIWXR/U47x8G8F/Jy5k9RlNIJdrByd6jRvT15zXcKVSq1TYUcRNzMqjSkjNAFLho
	1qQYnEuDtZw7atGKh9tu+dUdvwVqYvL1z9/JK8LvjzbMQ8FytlMWyR75dfZWknmj
	2SULBr9nOtM/PrKw16HaGYI6Gw6oqExCw5lS46DsF9OWAeNPF/wQwaS74TFB5AGP
	5ZKobQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk41t2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 10:29:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b222111167so122517985a.1
        for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768213798; x=1768818598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxMVnP7klhF7zuicFFjZTjp3gwEJfISaysxyhwsH6zU=;
        b=Bu4u0C4amzGQv55u6EpOQEEtFY7GRKj/YEvL1WGKy9IDYmL0ok+uRwq6SUwCwSIF6P
         zUexIOpD7hmL4rI/W7mSYNXP+G/HsCW4HPiMSzEnYWSxlM6c42UFQ+xkTOV5D/7T49Ro
         iH5RkVsFF3iF0B2HYOc8+TIxfBNRACHF00fWdPVK/zARO8ovPrrTEkHZK/ud4X3RBcls
         z4mOQv4FOANPI4wzAY37fNF8KTNM85MbuAhZq455jf5brrViMRvC8VSNDjKGNNx88Mwp
         HCIV2ZU13kUscx/01ArB0ukr1K6y652JTFNJva8x9715ydtQHyz9xjJV+sCFXZZfwlP8
         7Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213798; x=1768818598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxMVnP7klhF7zuicFFjZTjp3gwEJfISaysxyhwsH6zU=;
        b=WD4P7XdltG8dj+QmVVhS94QcZeYyNGD305Bt/JLslZG8Sc7Bo1/gZWZZm1gkAqal1x
         seDedvdOAK1PF0CT328ABkDnb5TrZHTDw4nOZaNM8pJuR7LHi+ROQQc5QT05UBvjgtyk
         jUNWJ0U1B8h1x2jqlZA5duU6s02JBb0rblj0Won6iZXV8HRgEcbmyL4iCfmeDXqzTTCi
         Kb5VCRbswz4fQ0iw3rHWnWtpsttCZX9DAqT5riqnKMLOzHplxYZU5PQV0nARaWJyVjGn
         q9uXoyV6X5nkl45cj7djWsGPlQYr2InYqhCKVdYx8BIhX/Y/pYvfMC82ncI02jvTdEoJ
         xidA==
X-Forwarded-Encrypted: i=1; AJvYcCVdp6DZiJ1mOod1fnlspDmgh+4r9K54Opc+vpK/xo0Lvcz120+LeksSA+WtY7YLpV45jz2336cRZkUGAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzayzqCfRbAv4sRY3iyv+dT+yyhl5wkWcjkGDra+Kvm+6bDQmpz
	SgIzCYtBbVyZEb++VJpd/2TON+EY1PjxqP20wVK6DrLs6JuSLTOOrWdEZkirlhD4JFXtL6UgnvQ
	F1lIjPKAQ6yKS4mSDT1vDvygAU/WwiX/+FBXhxs2dOV4YspisoOuc640SPt9+4vGksw==
X-Gm-Gg: AY/fxX6haduw97HU0fL6mSqcvhqXlWDLsszIsKjG2LMTugfpAQDOHBHZ8MUavta7XLP
	M1ElFjr/GPJPu05E7ws8FR4X7Nt7QkXjh1Q2JFNE3eYCSOvoc6wNnEPu1MUuC7NsubQF3SFpD22
	KyKz9DWsaO5SXu8HrWCO82/ruX9HDi5XzV8UAnlfsqUcVYVn8rCvEaL5edyWp64S57fnao2vLmx
	ShQTeJryhhn0ar9dno9u7arUSYZdo4FVV+1x24ogHxc9FvulBCp/ALliXsrS2fqU4M4BHmvc7l9
	QxAdRrAC1OOz5iR/SS6yCqpF7OgSrrWwJzsr5LqdMVEOddaKVDUbJajICnEM7l1ym7a4bzkfUs/
	rE8OGHHU6m+Te9kc+NK12NFe3rEVwLL3SWiBORPht5Uqjklqc6EkJ5E+cawDoSXz2GUE=
X-Received: by 2002:a05:620a:4150:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c3893dc319mr1707032985a.7.1768213797991;
        Mon, 12 Jan 2026 02:29:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYkinKvuUhGe4V4yaanPySErY45GVSf7HQse7lAC+h88C4FKeCk2VIkqMj67TZjna5NhPTaQ==
X-Received: by 2002:a05:620a:4150:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c3893dc319mr1707031185a.7.1768213797514;
        Mon, 12 Jan 2026 02:29:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09163sm593221066b.26.2026.01.12.02.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:29:56 -0800 (PST)
Message-ID: <ccbaff51-d7fa-4b22-8d4e-02bea5d8a529@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:29:54 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
 <2486dc4b-71f3-4cd9-8139-b397407d7e4d@linaro.org>
 <543d9e55-c858-40f9-8785-c9f636850120@linaro.org>
 <DFMH8W40TCJ0.XCTHNRJFJE4T@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DFMH8W40TCJ0.XCTHNRJFJE4T@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E2c5SKlCgiuVAQCIO0nsZgIOfdrxyYpX
X-Proofpoint-ORIG-GUID: E2c5SKlCgiuVAQCIO0nsZgIOfdrxyYpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MiBTYWx0ZWRfX0Nu+jKw9xUKs
 nyybMVLqea2g7nTkgtWGJkKObBX48lFxxczvbR4rMWvC8xI+dPrBspIdoOeiAYrrxgdHBqLvYg/
 ZzAI+Li12qHbAf5aEiwu7U0gGY78fLkV21vJ6iUJBi2y4jRbfyLpAicVaUM68jY7MzkscwWbXdF
 v42wC+CHK73UYVYuWo1lfi9kJfESOE7iMFZA0fgTnfV6BW6n43avod0jnTVls3XEvTONYoaG2Ct
 UDSvBS+NwulC7ETXaADOz8P2L3AyXQc01Z0Wu3MW/7jX9V/7PQ6UHkEEX50KNPOTwJHZjlGJ2Ix
 2HiD4ygiCsIVo015K82Th8rzq8SmbnHa+9HWJkbSG8FqqdwebsIE2ybndKoLtz0iOaRILcbFbDB
 yQNmeMS8puFqg1BMiE1xPLPrjqLvUKx0S5JhdIjOb5XcoSYr4xwyJu1rGOj4FdZS/nl+frLXlyL
 uImL4ELGmzo14AY9WKA==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=6964cd26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=7X8Kw1P6343en4nalX4A:9
 a=ZPF2tL_FRqzNxS05:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120082

On 1/12/26 9:45 AM, Luca Weiss wrote:
> Hi Neil,
> 
> On Mon Jan 12, 2026 at 9:26 AM CET, Neil Armstrong wrote:
>> On 1/7/26 14:53, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 1/7/26 09:05, Luca Weiss wrote:
>>>> Add the nodes for the UFS PHY and UFS host controller, along with the
>>>> ICE used for UFS.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 124 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>>>> index e1a51d43943f..0f69deabb60c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>>>> @@ -797,9 +797,9 @@ gcc: clock-controller@100000 {
>>>>                    <&sleep_clk>,
>>>>                    <0>, /* pcie_0_pipe_clk */
>>>>                    <0>, /* pcie_1_pipe_clk */
>>>> -                 <0>, /* ufs_phy_rx_symbol_0_clk */
>>>> -                 <0>, /* ufs_phy_rx_symbol_1_clk */
>>>> -                 <0>, /* ufs_phy_tx_symbol_0_clk */
>>>> +                 <&ufs_mem_phy 0>,
>>>> +                 <&ufs_mem_phy 1>,
>>>> +                 <&ufs_mem_phy 2>,
>>>>                    <0>; /* usb3_phy_wrapper_gcc_usb30_pipe_clk */
>>>>               #clock-cells = <1>;
>>>> @@ -1151,6 +1151,127 @@ aggre2_noc: interconnect@1700000 {
>>>>               qcom,bcm-voters = <&apps_bcm_voter>;
>>>>           };
>>>> +        ufs_mem_phy: phy@1d80000 {
>>>> +            compatible = "qcom,milos-qmp-ufs-phy";
>>>> +            reg = <0x0 0x01d80000 0x0 0x2000>;
>>>> +
>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +                 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>> +                 <&tcsr TCSR_UFS_CLKREF_EN>;
>>>> +            clock-names = "ref",
>>>> +                      "ref_aux",
>>>> +                      "qref";
>>>> +
>>>> +            resets = <&ufs_mem_hc 0>;
>>>> +            reset-names = "ufsphy";
>>>> +
>>>> +            power-domains = <&gcc UFS_MEM_PHY_GDSC>;
>>>> +
>>>> +            #clock-cells = <1>;
>>>> +            #phy-cells = <0>;
>>>> +
>>>> +            status = "disabled";
>>>> +        };
>>>> +
>>>> +        ufs_mem_hc: ufshc@1d84000 {
>>>> +            compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>>> +            reg = <0x0 0x01d84000 0x0 0x3000>;
>>>> +
>>>> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +
>>>> +            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>>> +                 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>>>> +                 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>>> +                 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>>> +                 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
>>>> +                 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>>>> +                 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
>>>> +            clock-names = "core_clk",
>>>> +                      "bus_aggr_clk",
>>>> +                      "iface_clk",
>>>> +                      "core_clk_unipro",
>>>> +                      "ref_clk",
>>>> +                      "tx_lane0_sync_clk",
>>>> +                      "rx_lane0_sync_clk",
>>>> +                      "rx_lane1_sync_clk";
>>>> +
>>>> +            resets = <&gcc GCC_UFS_PHY_BCR>;
>>>> +            reset-names = "rst";
>>>> +
>>>> +            interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>> +                    <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                     &cnoc_cfg SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>>>> +            interconnect-names = "ufs-ddr",
>>>> +                         "cpu-ufs";
>>>> +
>>>> +            power-domains = <&gcc UFS_PHY_GDSC>;
>>>> +            required-opps = <&rpmhpd_opp_nom>;
>>>> +
>>>> +            operating-points-v2 = <&ufs_opp_table>;
>>>> +
>>>> +            iommus = <&apps_smmu 0x60 0>;
>>>
>>> dma-coherent ?
> 
> 
> Given that downstream volcano.dtsi has dma-coherent in the ufshc@1d84000
> node, looks like this is missing in my patch.

Seems that way

>>>
>>> and no MCQ support ?
> 
> Not sure, I could only find one reference to MCQ on createpoint for
> milos, but given there's no mcq_sqd/mcq_vs reg defined downstream, and I
> couldn't find anything for the same register values in the .FLAT file, I
> don't think Milos has MCQ? Feel free to prove me wrong though.
> 
>>
>> So, people just ignore my comment ?
>>
>> Milos is based on SM8550, so it should have dma-coherent, for the MCQ
>> I hope they used the fixed added to the SM8650 UFS controller for MCQ.
> 
> Not sure what this should mean regarding MCQ...

This platform doesn't support MCQ

Konrad
