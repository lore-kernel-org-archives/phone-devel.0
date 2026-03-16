Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07C394789
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665451; cv=none; b=VCGooUM7KhbsyaMXR8YVACB0Yqvl170VH/LvYLy/fdNrm3gvRdFuI8JKa27cpmf6pMwv8pyOsdlVGw4bY7F77YUmqtgo7LG84jaZ9gtJxEN1NLueXaoDOicgeewYTVx0DCgNXSAL1fJGj3+e3lOxYJ/ZOIzBksq6AjnaEjTZMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665451; c=relaxed/simple;
	bh=q4TM2LlV744b3L/EatHrhl2+N3BL+B0D8u0nAFHbvnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tl5Vk5mrtzqPTNlh/znotSr7qGXbBWbcAvbmesMK+WzCVHBr1+TCSeggEReCR+bMyxNuijTFFKP4I0usBwJ8ZG75KFDNiFMvDuhhzBwcqeLpmlxkDZQb7o1CCkVJQcHKDIeOEw5LW6qSdIAPFpbThgX6SW0HX9+rYOhU7mbcx8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOHJHkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTM2iN05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOHJHkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTM2iN05"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBigTA2129174
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=; b=dmOHJHkpvjGuOt0p
	Mn+S4MFRJD728igNpk5vwpHk3sL/CKJFy3HpOvq5wEMuL9tGAyeEQUrYYaFJmL/w
	Yzf/KzaKS7DagCGnJazuomQhcgKptv9eWmrfWdvBiqTjjV7gZYqQ6SXUU+B4sbO8
	XbI7oMDZwQH3ZKdnWVW83c1nmbXg7UaWdXxfHWDryfiSkzs487McV1mXyLm2EFSy
	LsVm/wXzyuFDiDiqwSkp2qVx93RLtmft5jBSLmkZSFTBGZPEa4s8sPFzGqMK+/Cn
	cGRgV4uwWkPfWeky3zurdhl2OU79sA/JLql7Jvt4BQH2fToKrj6+MpZ0kdO3TiJw
	vFgzlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anwst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 12:50:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso286997085a.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773665447; x=1774270247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=;
        b=YTM2iN05WbgGscYinMZW+QSeiNk8ZTlorMoeZ/ojRyefFbqRRVMZoluev2bsi0OtWZ
         FYrOIP1u9D/UD56hlUN8bRUkGCsDnuNHFz/Lp/iPlvhA8rGVMlY6mCWQBav2/9FOyNJK
         ZywWwK4FiW7Ep+TYjG07f57TEG6ynPBgl6iEwGl39PhzXFPPlA9kd/60fbqfSVgGfz/B
         rHvGf7ABxQ2wquZO+JZQhkKFUtK7FoviwHqMpDw6naEFlurMnw8dykumQhQiAH1anpiM
         VCgT/RxxEv80eDDQp+z4NGiAt0iFyBaQKM+wrWjh5V8VxNQlYSiguVHaOEnfSw8KR+q6
         ZDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665447; x=1774270247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUoaoPLDpNNWBVk0FzY1tCyE6j9Wdf3bW45GK+7R3Sk=;
        b=ZHT3ZmfHOLqs3VzwTwx7dc5YStg0gq72CSQFP6+H2IT+bzWvjSx5e75ghpwLDhRsZH
         ErBEBH/baFiS2b34mqAz2ijZBiELJ/UzrpQjz8tYaCnxKQ1B3txVv9n3O4pDm823oalc
         Xws5ChUlkw66pwERtdpKP75PwN86pYcq6wDjyeSk6ZLUhl8XL0imy5BVAapz3DeB8h2n
         OWN0vRuPBmj3vMWGxSZC+TOxaAWbS3akjtprCBje640CmRoZ1plVxenXfQpbuwnfTEUT
         29ECPTNFe/5HRGCXjRyeVt+lYUckND+UTO0I2xiHBxClPB/6b3G6eLusWzbK2SStP2pq
         Y0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz8PVq7IEDUbUSUCI1+N94gKBeV9Rfha0g4tWTerRsUa2EWG8AAtMGZF4IQ747FyUrKrrY2gnG1a2JAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc+GfpzW50R9hNFw0Ts2VMN1s/crDcJmQzT4xyNnqHUKPLoEIi
	xrWhF5r4bEAV7VSRDg07MrqViJzl4vZKFMJGdPqNTtVrU/sM536T0MB/xfAkjQBgYHXZZtph1gW
	eCXVhKVKmvo0SKGmwyDSVI54UKsfRxIIgrUOnt0LB2moP/eMqA5BxI0kfA4GORGv8nQ==
X-Gm-Gg: ATEYQzyKeffr4EQIsCNrR5UT4h86ISoOA87sofVDR5/+b2jcv3SQVQCmA5rUgmwnoGt
	hCa3j3nilcadA4a1LSYiH0ByR2pzGVao39Xt84gS4VcF6k9fbPYheKyEFdkuRlJHxRM9e7c35uL
	vINsM0rejY5PQe/ZrVlq1tw/oM4SV6CZMm6JV0SeHk9WbJcsgTag1ae/dYZaun4M53q0UrpokcC
	Iv6b0na/V8ZVSSEhoCMVZS+7ba6YRwYsg6uLoso7DOTeAjzLi/0R39DkGDJ8JGoGIL2SP6oLJ8F
	pXRN/1tlE99BE3CNTQJfllK3tfgdTr5ww/1vS9jbNVm5XuDjeNHd/8ZXgQVxHmBorHTpt/L8rAm
	0yQrcYQsUE4kaE3Naif1IGocOlTL/AYSVYMvov9zocDwBYL4r0pwzWAb08dfzbxfH0KP3/cvWU+
	CMq4Y=
X-Received: by 2002:a05:620a:2948:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cdb5a83e13mr1254054285a.4.1773665447272;
        Mon, 16 Mar 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cdb5a83e13mr1254052885a.4.1773665446900;
        Mon, 16 Mar 2026 05:50:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6650f44a4a2sm1924768a12.15.2026.03.16.05.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:50:45 -0700 (PDT)
Message-ID: <71f2b29f-a34d-4300-ac9f-ef33694e1f90@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:50:44 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
 <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: moXdnXt-Jnjz3qkT2Tds8ep71YMFfLRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NiBTYWx0ZWRfX/6Ab9C5U8dQA
 NMYANjxFXgd9ep0jKaeL1VWt1YZsTfkM73gxyXkF2SP0QWcjnZrOtVD4wLWASK3Kqds21vg0oWq
 oW/6VIFViP2vYzTlFCU6iG/R4Ln1zFzzZXjRDRHnN+7CYEOeKTM7E6yhbRFOcmYtJFNoS3mF8Be
 +netvVwNjfqiVkDZ8FGvXta6MXXEDDQgonWozq/ZmymY1ykak93v4oxK8UIS0DCmI0EMpPGpGkh
 dmjxx0VTmjKqhjej3xUkjfcPPAVSGKlwdrmNB6/UbYCHw4v+GKBlkPjQoyH+07waHOJme7+m4Sc
 Y+QQPkg8TGujfKiyp/DlJQ4lK7JeuS3WJw6qJnR8n3YqopndliJyBM7bCTRdyGa6tq2P0mBfCTI
 wUoRN38N1TBtFjfu9t696QGaWPmgvtQX2o0zn5JpkOl/u6QsxQ//3+ZIf2OVJKfvSQxkMXmWFOI
 0sKZHtSxYFG9rfWHaGg==
X-Proofpoint-ORIG-GUID: moXdnXt-Jnjz3qkT2Tds8ep71YMFfLRb
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7fca8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=UjuIjBpub3zfU3wH7hQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160096

On 3/13/26 3:00 PM, Luca Weiss wrote:
> On Fri Mar 13, 2026 at 11:40 AM CET, Luca Weiss wrote:
>> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>>> parts.
>>>>
>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>> 'clocks' to the PMU node to make Bluetooth work.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>>>>  1 file changed, 174 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> 
> <snip>
> 
>>>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>>>> +		pins = "gpio53";
>>>> +		function = "gpio";
>>>> +		output-low;
>>>> +		bias-disable;
>>>> +	};
>>>
>>> Not sure if we need to drive that pin.. perhaps a pull-down would
>>> suffice?
>>
>> I'll give it a shot, this pinctrl is coming from downstream but perhaps
>> the downstream btpower.c driver is differing in behavior to the upstream
>> PMU driver.
> 
> Seems to work, but honestly I'm not sure what the actual effects of this
> change are?

output-low actually actively drives the pin low, while bias-pull-down
connects it to an internal pull-down circuit, which is weaker, but also
saves power (because the pin isn't actually driven)

Konrad
