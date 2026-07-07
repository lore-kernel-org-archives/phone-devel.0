Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F273B42F1
	for <phone-devel@vger.kernel.org>; Tue,  7 Jul 2026 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419258; cv=none; b=UFyBFyR9QVqX2p3Eq5/f1najv3TxpozYBPZD1BKndagfxD6K4fG6PJWBMO5JeGwBcMkfP4qJ7Uz9oCrxsbCOqiKK22eTEEZFgDZDBZrRxUg1wNfDcM1Nk91tkABIZdWe4fON22ViHGy8N54546e1jB/o+4LJ0nMweprF6m862Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419258; c=relaxed/simple;
	bh=Dh0tPcSqug028EFE+Bh7gYoEMsrwEvamEbpWBAp/dS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsNg2BbZgFAl8APonCHTpVdCfpNcCoxuninnKdfNtLtRuGs+tginzZiSRB4dkIYwRpWVvvcEmL9L6RXr7mGn4g1O6YqVdkD1cAcFtOGE9yaJKye/m8F3tmCVH+NGI5mJgMEwxNqStsfpwRiHg7Y8DOKRLntgpUg0wpUr2Vu8EOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHekx5LI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6O/jUlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHekx5LI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6O/jUlC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DlEh3182161
	for <phone-devel@vger.kernel.org>; Tue, 7 Jul 2026 10:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=; b=OHekx5LIk1J2XdP2
	vWYA2bxSGx7B6O0X8RG/XqS2REXIThqEjSyxw6c/Zj90a4c44GUG9aFNGpprHYcg
	A0t0qlMmWPftY8ZRDMDPCta7NTDpZ5uOeJWEBfKu2wCmE1+khZyLAgIjidqJfWxJ
	d8pXGT+DX6aQ17laHQQu58TxlXkMLQkpk/CqMl4Ef6nzwWnVCQN4wWoxxzDFsEBR
	QrXIeK9SpBO9G1LKq7g1vxPIjbn3UyC5V/6IfAbm4ohTxjeu6Hd6Co9GSA5omlRL
	SG0bZsU7tmglNior0XFRyXFFaz+RUwYa+BzrkjiIPICRMf04cqB668PLOKA4//AS
	NqS/Ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8xtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Jul 2026 10:14:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so11063041cf.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Jul 2026 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419256; x=1784024056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=;
        b=E6O/jUlC1zwGzyPwhc0uBECDpzFARSq106vso+abhSsMhAIzKSyTBs8aVbGKPWHbhF
         OAwIQG4yVcrnx8H9loeFg3iq7oHNVaA389lzcHfZZ9yBbDCvKzhyrMH2xhJDumz1I42q
         B1UIqvJ4ju8wapH4FggcJtKSiApiHdVNN9R1pY0VYbdpcIYv4wB9S9/DZJoNkQ2xPuqi
         mniu14jefAqa3z8lmWErSUPll/wjidiuombK0AlHtDobqfUT+nzbcwfpFx0i3f73Q3KD
         hqTQ8ssQWjVTrQ2La1Xn3zo6peLstB+2affyKENngTeqCzZcwJfF2cLgL50+4RQL2nlZ
         pefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419256; x=1784024056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=;
        b=JROCiTAppzSeUPxJ9+Ubu19A3XIYZmohVID6wmUbbuCt5yK982EUa5l/5xnTXpuVWo
         gEBkkQPNW3s/4DNdIAeLdoV1mAG2PaxauUD2udxsnVX0ynCO9za4ANm1HS6jU5UX+bVO
         82Bm4dqcBCNYsLIckpoWrlcQZXeWFYGwN/hqyZfLqKmYBlHRK9HzJlPxEjoS2HmfZo72
         HfFAdKfdtEL/rPrlZ/HAgLoAWFQC3/mdgmv4NCnWcG06ajYa0+Y+Ghw25QayBEZRauhW
         WID1cDSfckQx3KYNg9MPugMOPVvqG0bnwpIpxw0wLMSJQJOaLivzqG3ero7NPhFtv7JO
         pNyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8B95zMJ/0qahAjpHJHb7sYByS2bgqHBeVafK2BKEw1Izw3vibrLkPjhCf5uqesu/aUvG5TjyMnwRC2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXO4tiBmvJ/kVnkUuvyk7qicICTU96rQBJlI+F8YsciEXLrVYK
	x3xfxjwIKZdevGhgoJ8T02F5DO6S3PIfHCuzA0CQITRhVMu/ZF3sS5aszGHx94M/WpMQ3MCIUjW
	KOt8N/Ec43t8Vy5vPguP1gdzlxP+j/jMsHXBogrDjG8o3CMpqGIqAGnBsDNomW30Dtw==
X-Gm-Gg: AfdE7clu3yPlSKFHz1zxvvXIawRVritrBklqkGxVso8IFHqsWYCHoMo9PSwt7oln0Dz
	/EC5SWWkGKpwDoLUQOFZpwwhvPsPdn/irdLm1O4J5ANDrIypBq8szthJHxmVaC+FhOIYPF4s4nR
	ul/MqH82kVGjglSDxTRCqy93gt7gs4iEoxRxVo1lq6/Gl/L+G31G8UWyidi0p6TK6WsBu8xIiYK
	yNcvK47hWklMqk2hBkGeyrqB4sJ9eI+SFiZU2cJbe/GkTls8XKwv8HBdFzg/onCCqb2W5MCd5zW
	4MYU0OQ+4tVf/IJSJ7HuOLT+a0COGt1RU15SZpwYl85TGW+kCYdsKJB7/4RHUYlspC8GFbPNb7p
	cmCz6w/3aMDlBrBcBbRqNLi4qw8jouPfaUg8=
X-Received: by 2002:a05:622a:3c8:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c79f43e06mr13717601cf.11.1783419255697;
        Tue, 07 Jul 2026 03:14:15 -0700 (PDT)
X-Received: by 2002:a05:622a:3c8:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c79f43e06mr13717391cf.11.1783419255310;
        Tue, 07 Jul 2026 03:14:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bca25sm100329266b.35.2026.07.07.03.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:14:14 -0700 (PDT)
Message-ID: <d695c08c-1df4-4036-bfc9-b07dc44c9e16@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:14:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
 <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
 <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F5o1_U04sj7u1X6OBwc5ODNPzMFGoNOA
X-Proofpoint-ORIG-GUID: F5o1_U04sj7u1X6OBwc5ODNPzMFGoNOA
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd178 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VKWnMpf-0DTvsSkH75gA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXxx3GwpdAnOR1
 qehzbX8ZyPj1rThhRZaNiEtESi3g56scwbL8WFkKuyvgHMU6+GagcNHpPiHDghWQuieo50HHWRb
 gmjHIFhdMpH59qLQ4TDOZAJzzxHuEsEF45W2vK3O5LdNr22ynD18Bj/zdtXdKmFpS22rHAbwE+3
 TeeXcFfFiluZkbkd3mA3o+d16krLQL5nGXJWM0fA/D6DIcbHv+FtnxjeAu1CotIs1bhU6Ddcy/C
 BmIk2NQkc1KFVoTFzV11RLJ952eIxwE0wELi3uxJoZ/xzEuroncYmFAON0zDZkeCfphvalSJw6P
 XLTqF6JTM26FUWr+Ef0a9B+MqOxleeJdZnfAPVAe6Zq50Azag+E9oPL44LkerM2CgDHtlzUmFu2
 tEzVVKsi7aheP7T1W/JAHCZBlXwUZzq1Vg7p0BH8fIfqhGGz5TwB4u6w2QOHyidW2D2k3Gz2W58
 Y35KZUjIfMVnNRN++0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX4Sm3fds44X1d
 qo2rdyjU7AmoRqfEtFHkHU11pkH3eqCGTfmfbVhj9S0GfuM47qQYQtvnIFnpMg4DwEF8HvxweIG
 AWVXGR/Wc4lrwoWdIMPN8mRJ2cRrXGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/6/26 4:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 03:38:42PM +0200, Konrad Dybcio wrote:
>> On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
>>>>> +&usb_1_dwc3 {
>>>>> +	dr_mode = "peripheral";
>>>>> +	maximum-speed = "high-speed";
>>>>
>>>> Does super-speed not work (if you also remove the qcom,select... above)?
>>>>
>>>> Konrad
>>>
>>> I can make a file transfer over scp, but the speed is inconsistent and
>>> slower than with high-speed. Must be because this device does not
>>> support USB 3.0 (super-speed).
>>
>> I'm asking whether it enumerates as super-speed if you make the changes
>> I referred to and use a super-speed cable.
>>
>> Some devices wouldn't, because not all manufacturers connect the
>> necessary TX/RX lines on the Type-C port.
> 
> the GSM arena lists those phones as having USB 2.0 only.

This may be inconclusive.

Erikas, if either DP altmode works or you can see superspeed
enumeration (downstream kernel may disable that even if the hw
supports that), the wires are there

Konrad
