Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536F322C77
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326072; cv=none; b=k6RhojBtN4tyFhXVV7AQy52eH817w5SbJ9DkNfi9p6+hNWTr+EC0XToC1/Jk5mYSu23ngBLjMYL7BGMq2ABGOs3LV7Z0V+YrO23RJeVWk0RlvGoBrKR05FQB4K+5ZSUfD+q9LPYVNUWVN1LXMvPnmzzYBmG43xu2A7CKn9ZHgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326072; c=relaxed/simple;
	bh=TgP4eIL2o3Br0ZpQFwhQ+40TY+blI4J5W7HKlZRoZso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avZCjvEbEDPk3SWLzbOopIB3ZaqxCeSBGx4ZiKAqRo88NZ8L16+U1qdnUFAbYZ1y635gEZQThJm0mRpFZUWbXLYscb5lQQNbjGDLXf24sxmF6s+6Cay66jXXSoD5AtrOfjhrtAzfrdnw0/hADzrve9+p/JYIQbZVpo0A6yOcd98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ6ZQS63; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIsf20jY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ6ZQS63";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIsf20jY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6juEn3392907
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/MmwzlzQwA4NZGjD9k+8lgzrwfTbajopFzs7MjCYkc=; b=AQ6ZQS63FTGad4IQ
	sfYXPtYeq0a+fsi7ei5vswvpo+2W3qWPkdanCi3yWTRwwz6G89JG4LKtiz8WE0B1
	FQKdLmX3xC3qq+gI8aA7GZCzjG2Ilckz18I94GM5cFVBgdSsRlp6vVcqoD+LtkdY
	OCCHAZZb4azywH10yyTrCMCOtjm83RwA7SBaOFDeQ0vDsgiWYOxX/0iJdXmlRjFE
	VQOUcBxC4Vm9qfaDPzIJBL3qsAKe7zUy2fkec4EaFL+Twhm9wIUxCMmtghRO/dqQ
	kF9UW6lfHTiHy8eAxoN8OK2eI1j02GBlF0xU//r3KZm3CIhAiOiUa2NHk4MUD/Cu
	Skz30Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kha7kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:01:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946ebb51a0so33056986d6.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771326069; x=1771930869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/MmwzlzQwA4NZGjD9k+8lgzrwfTbajopFzs7MjCYkc=;
        b=CIsf20jYPoFH06lLNN2a+Tf/lrZSQKSnR7SUznliryzTx7bO9LlUz4bIKLcdtJlYzj
         cRXPaMcR/SHBss8bXc3R5k6E1KJLm8zUmoemcjmblPtJExfcrghuk43W51swGpn20GZq
         pkHvz/nh4C1fgLTp9hMnE0Pw1/LC5+BbaxmDjVatwn1W/QrD7Fo3yQ1LcO1OwIvn4m2s
         8dfvFSlNULX9RT9EuhamPr4zwstf+Y54YrAwFVqW3AClGG/jmX/fjeJ1eOVoEFrOXwC8
         4AqVgR6njUN7yRZ5VyZ3MIYq1QzL6lWGKiDc+AXcJem3eDTK85iGKDwtgB71qnM3MsNo
         45Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326069; x=1771930869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/MmwzlzQwA4NZGjD9k+8lgzrwfTbajopFzs7MjCYkc=;
        b=QBjsOVyKZaoza7hMkQfHNTX7Eyoz5rL3etPwi46CzPNqgKyX5fuFEzHr3SOL3uyliI
         4MfwUWUA57fgzHHFDIKZ/qSXANVfH4RkrfvauP9FsEDYktysy7ct8nHF649Nk624BgOc
         GNiM0A1DV/bK7YvvjH5MOJETLCtjy862FD7zg+U8lGP4Bk0faxa1NcmnEcHjjFYaK45F
         AlXEkNKh04e3focqaVQvw9NgxYqOBlC8lMb0HacjFaKZ6IhIqNhH66kBo2IkJdkS9LMe
         6dYtdigj9x4gJDO/XJrACjuwyiPUkt5uBCeZ34tGcJ5itOPIlyex9BvXGKbqazyoORyP
         5SSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFt49zHu/cUgBgXECKYeHlzQjwB882XALFTf346jBUjXOt4CqSQAVNLA3zPTfwIQt4ya9gVvAj6XU+LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweWqHQ4WgmJpjaS9Tdky8WaDzTLwcDtEAvjjJpWQiMdmXg13RN
	pzEbkiC5tfVcgGdfSMlGjC7XpREzlrv3GcoWp3Vfy0SzbFvaTdAyEG9GUfAjg5Z12hMu4FNm1Va
	Jq/6tjGMTDphI03hZ1fJaCKSjp2VEtZytnd5JvuOgWPCXa4tx5YrpcSUGbYrtvJ8KXA==
X-Gm-Gg: AZuq6aIj2/TqRglrgexeb1VeE6dWy9y9rWbaBVHN3z4e5OafjU2C1DKB/5qFw/Nk8Aa
	5Zu0dy0hPRdbJfCNT6uOFcAZBKmP9z28EP4+5zUmgohG+1guoQlEj+f1c+4Ep/hEeD3abtLoh/4
	1CZ7+myV3QBObINYwJN5Q9wWPh+GfuwyS/taB2LvU3+kqRhXuBCpfER3xWAvldfxkAhStvsIY/i
	6/sPXqlevHPr0frEXYsFkx1CZAMLaaxyeXPvNb3bhO3Y3gb5ocpN4fNibgbyAV+jkjkrA9P4u5/
	n13t3Yh0nLybD6qDH4+YqlqvP1Zn76dDMZ5QlIT+AxXF8wB2kpRQ5V9b4tBUijc/HXnMAVfvA8z
	3OxBLEqx7326CBD1/ct0x6XafR0U4RFlWRit9cMOPdneHivdvOkgn3O/tbs/uLQAGbt3VOOYPLL
	3EM8o=
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr128481816d6.8.1771326069410;
        Tue, 17 Feb 2026 03:01:09 -0800 (PST)
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr128481366d6.8.1771326068897;
        Tue, 17 Feb 2026 03:01:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm345474666b.38.2026.02.17.03.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:01:08 -0800 (PST)
Message-ID: <722f1bb8-250c-4cf6-b409-05f0090330b8@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:01:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
 <DGDVLY6M6E1N.12KFFYAGAD7H6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DGDVLY6M6E1N.12KFFYAGAD7H6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69944a76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BzWC11Xf9Xekc_JAJjkA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X0bnIfUjv6AojqQNVMfedbM6rhdWtTJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MiBTYWx0ZWRfXwb2BMgXpvEX5
 1nzCciRraoKyqUwrRNsGX0TLJDOSW51WjKNp3R52zYoj2OaSymj12kjVn/paO1mCMhEEy+L75Zp
 7obuNN92TwTTL7muoGfvjzFBeF4nPuLfE+4QcMaSCah0QqJ+GboIyAlXPwV6y9pVhSap1pWkS76
 tQhkV+Kx/FZd4XqUso8TsgQS1DTKtekrRkmt/6UsEuBZ6I0FY5EeZCsBQR4S53eFijbY23DGLMg
 pwwbBa2aK7G1q3Yn6ylWwmlh5CiOQ0QsSRqg37QLIuLKipuOmxe7nd4fpPiNDXWzfTw0QaBKDm1
 mTxgzcoXlXCVyGhh3RujxaiqkGFkGzNyfh9DM4q1eWGjFUNZhQLdO+bdvqaFGgI1G/l2sqtDyk2
 4VsJv6aylvgTjVQnxQ3Wo34YFl2GfWixRAAEyI18W5FshkWw5aEtXPd88/2Ma4vwMJTi+PG6SiU
 R0xODquYuTw8ZN2iFtQ==
X-Proofpoint-ORIG-GUID: X0bnIfUjv6AojqQNVMfedbM6rhdWtTJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170092

On 2/13/26 2:42 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Tue Jan 20, 2026 at 3:39 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add a node for the WCN6750 WiFi found with the Milos SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 46 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> index 024e1c9992fe..80feb3e9d3e2 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>>> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>>>  			};
>>>  		};
>>>  
>>> +		wifi: wifi@17110040 {
>>> +			compatible = "qcom,wcn6750-wifi";
>>> +			reg = <0x0 0x17110040 0x0 0x0>;
>>
>> This reg doesn't.. sound.. very.. good..
>>
>> The size being 0 is of course wrong, but perhaps more interestingly
>> the base address is a register within the GIC..
>>
>>> +			iommus = <&apps_smmu 0x1400 0x1>;
>>
>> And this is a PCIe stream
>>
>> But I see kodiak has the exact same setup..
>>
>> After digging a little into the driver, that 'reg' is apparently
>> indeed consumed, as a base for PCI MSIs.. I feel like there should be
>> some better way to express this.. non-everyday setup
>>
>> There's this commit message:
>>
>> commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
>> Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> Date:   Fri Apr 29 22:34:54 2022 +0530
>>
>>     dt: bindings: net: add bindings of WCN6750 for ath11k
>>     
>>     WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>>     Though being a PCIe based solution, it is not attached to
>>     the APSS processor (Application Processor SubSystem), it is
>>     instead attached to another tiny processor called WPSS Q6
>>     processor (Wireless Processor SubSystem) on the SC7280 MSM,
>>     where the WLAN firmware runs, and it is the WLAN firmware
>>     running on the Q6 processor which enumerates WCN6750, as a
>>     result APPS processor would never know such a device being
>>     present in the system and would not detect the WCN6750
>>     hardware unless and otherwise WCN6750 is registered as a
>>     platform device. This is the reason behind adding WCN6750
>>     WLAN node in the device tree.
>>     
>>     Add WCN6750 wireless driver support, its based on ath11k driver.
>>
>> Sorry to hijack this patch, but I am not comfortable with this binding
>> as-is..
>>
>> Adding +Jeff in case he has any thoughts
> 
> To be honest I find it a bit discouraging to get this relatively simple
> patch with existing bindings blocked. Yes, the bindings are probably bad
> (not that I can really judge) but sc7280/kodiak already uses them and
> it's functional, so I don't know what I would need to change.
> 
> Re-designing the bindings and driver seems a bit overkill to get milos
> wifi upstream.

I was *really* hoping this would attract more attention from the Atheros
folks, but that seems not to have happened..

With that in mind, I think the way to go for now is to go forward with
this is to simply roll with it, especially given we need to carry this
setup for kodiak regardless.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
