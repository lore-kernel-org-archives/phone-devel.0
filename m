Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2C22AE5D
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574232; cv=none; b=PE8v+5lgzmT9+mGt7rBhMrNaPMf0OGPaAViiO+qGXZOCQmBaaYj39BAKDpPuiaCJ4BumytSu2rHMvISoUFWelmpLWnQ9KumfPbjI79ie8OQt/YQTUJ6qtU2oyISFjEMlzqzUteuvHLd0wVnIh1AWvmoZ5D8hfc/M/lEXZqA5Yps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574232; c=relaxed/simple;
	bh=nNTfSGXw2geS8UBiT4FK+yp5IGwsYzhIrt8si9K/yUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnI72f5avOlguR0/k3cKYeEQwINhU9Gs7INwwIb+A5AstyHqAxtGRWmLVwO54Doz625bfMsKyaakpLVrS/pYf8wWc9Zdt7crUjloA238vQ9FjtNDA6WKRqllEF8Kdx0H8y/hyVuiX+5TwTTmJSlmGjVByuuCZPCi1HGPLz4S+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJO5KoRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJO5KoRi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATh0S003188
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 16:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ld8OromtzDWpFiO+c4IGRa2KeSsgIr6PZMN7pzdN+fc=; b=XJO5KoRioUxrMPY4
	LdIxKld/w8KboUIHZN9dbUw2v0iGIt2zOjFInfDioVQ8W7H2L3oMRmM8UToM/CmG
	0tBbjuCnFbcISLSPD6lNA8BZCzwK2CvgxT5WtCy8UEyxbW2rZu+XddpgKEBL/0M7
	wfUujxFJ3apZY33qnBgXBzfZyFxxcL9vAwJmDPfxlxjVkX0yNw7s2mtpdM3dtiG+
	mKOOiT1v0dTpQoWC5CEsRuSptW+TsncfI7vNd53WQXjinNjsyB4DgEXXkzOfsuqt
	icfnKpZaiVqdtGVIIf68MkgIDy361x87W/Z+JETZ0PpSlQC1WHplNx2bvXzAhblK
	7gqJqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4p11bbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 16:23:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91a184588so58868436d6.2
        for <phone-devel@vger.kernel.org>; Fri, 21 Mar 2025 09:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574228; x=1743179028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld8OromtzDWpFiO+c4IGRa2KeSsgIr6PZMN7pzdN+fc=;
        b=BN4jRwsP3OPfsQu+ER7e8OFxu3ebfKqUJkr9aJkiH9BfgxohwX+7/GWitNNcOfqzGa
         8T23iysjvqXOaEp7nf03WLomEZX3I6ZOsT59YBTt9SyrcS9ICmbYHwQ9tdMloELK+y/1
         6ffVZSye7uFjaqt219ABZT+o8OvNC/SKxcRVt3ttDMBJ8FbATYZ4wrb5WvAc0bzvFH48
         Sgqp85/S9aDCQ1Y1TuwIr9cNFx9A5Ssdpo5FEaurB/BEOZ+BXrXZ5siBawrtoPEGXCdM
         7uhxrsd9s2DRn8clh9TKvBFjSEV8k1oiMKaQlx00Rl/5NmzIdiLsK+INFBfD7YNJX3gI
         SCWg==
X-Forwarded-Encrypted: i=1; AJvYcCWi0aetjtwTHPBrwBFxAG1e6j/uukWLsyxkFXOzdGe+hn64BJZZP7WZ7NdmnkQ1E4K/+VYanDMpsTqfZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXk1Pni9/W0Os5AJWSqpeJLzopHiXqG/wraAgdyU2LcpyzA6jv
	AyAg3FL6V1ZWGho6eS/C+xOQ1qXSXNEKFhyD4fofto0D/hf3n2ZTX+pO/eneAzJ9VwFK6Hrz2GK
	+vaFNjEQsDgKsk6tbUPLN3cAxj4yskSPsvaR9WWIwNlP07aLFMql2RKKSMh+/1w2jb2fCxK23
X-Gm-Gg: ASbGncsT8B01WCYTXAleNXr/Iwj63AG63MlQH3cmhB4WHSkpDzA208NF3gAHYKP7O+m
	kwBdAz6dv31OXy/nxG4sQl+ji9OEkwYhMtiZEU+Nvb450hKNpGM8HKwXssnjLqTz/oGU48L09dW
	riudIxZqsOv2gsjgqzQEln3MogHy2462mg8fCdYK18c7BYH/KhD5UsGWnQP8TkFUJmgrTb6b1PD
	xGqG3yyXdGodC+gUi/ag2pyPIxwqWOfBhYp0evQfg0A2pZPRsuHA8tXvXEPtka+W/LFt2EPLism
	vjTiibi4pJDA3LCtLTwKxuKFOSwrpB81+/5YrVVwZq0sdt88POxQobZUiqDpbOTio6kK+Yod75G
	Q+EcJvPObWwIqHJ/ixhhsvBIWHkuoWkDcbckjNgr/KSBBxWmzg9B2OrsJi8cQYMfYlF2d
X-Received: by 2002:a05:6214:766:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eb3f36c428mr55377366d6.34.1742574228049;
        Fri, 21 Mar 2025 09:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX98Iv6fQ9nBxZLEJQNiNCADCajpNV88gT+BPE+tv7DjRfCojEFyMDyypb7cv/sb1yB5O5Ig==
X-Received: by 2002:a05:6214:766:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eb3f36c428mr55376986d6.34.1742574227570;
        Fri, 21 Mar 2025 09:23:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c2:310f:a0b3:1d12:b116:f8e6? (2001-14bb-c2-310f-a0b3-1d12-b116-f8e6.rev.dnainternet.fi. [2001:14bb:c2:310f:a0b3:1d12:b116:f8e6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm2720771fa.105.2025.03.21.09.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:23:46 -0700 (PDT)
Message-ID: <dbdc13ec-13ca-4d80-8c96-26e5e7b4ab3e@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 18:23:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
 <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
 <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: It9r7ch37L2TxoCsg4AAYNNusAwU52pi
X-Proofpoint-ORIG-GUID: It9r7ch37L2TxoCsg4AAYNNusAwU52pi
X-Authority-Analysis: v=2.4 cv=NZjm13D4 c=1 sm=1 tr=0 ts=67dd9295 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=5zAZ7Tx_SugcLKjGGPAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210120

On 21/03/2025 18:15, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Fri Mar 21, 2025 at 4:56 PM CET, Dmitry Baryshkov wrote:
>> On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
>>> Add a node for the videocc found on the SM6350 SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9df67ee1cd74820a6 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>   			};
>>>   		};
>>>   
>>> +		videocc: clock-controller@aaf0000 {
>>> +			compatible = "qcom,sm6350-videocc";
>>> +			reg = <0 0x0aaf0000 0 0x10000>;
>>
>> 0x0, please.
> 
> There's currently 80 cases of 0 and 20 of 0x0 in this file, is 0x0
> the preferred way nowadays?
> 
> If so, shall I also change 0 to 0x0 for reg in a separate patch?

I'd say, yes, please, if Bjorn / Konrad do not object.

> 
> Regards
> Luca
> 
>>
>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&sleep_clk>;
>>> +			clock-names = "iface",
>>> +				      "bi_tcxo",
>>> +				      "sleep_clk";
>>> +			#clock-cells = <1>;
>>> +			#reset-cells = <1>;
>>> +			#power-domain-cells = <1>;
>>> +		};
>>> +
>>>   		cci0: cci@ac4a000 {
>>>   			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
>>>   			reg = <0 0x0ac4a000 0 0x1000>;
>>>
>>> -- 
>>> 2.49.0
>>>
> 


-- 
With best wishes
Dmitry
