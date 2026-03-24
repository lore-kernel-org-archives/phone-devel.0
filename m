Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0A202997
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345341; cv=none; b=ZWv2GtKb3paX8KIpOXEvI/tCwdTQLnuHBxtkosk61sGViz+DQrRgbqo8BmeMjJZiDiGd4HVLw2rGzsNQjGZVsAOUh38DWILF+C1OM8Fg+bv2x3VHZL1JGdDUJaeGFHELjaYrfZFTLCaFgQyb42AhUxeMhnxWeDXmCThRQJtCGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345341; c=relaxed/simple;
	bh=od4x9CkAgwPG4jvGtgffyhwBA9v5TLV/vaYUX4T9nvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVyBUaR1hKVBuGfkzydOhcNWV0lt5OYOKLtrgLAV2f8HHPCCZlmRasRMWcnrhaj0YWIvDOI04nUeZiA5AbzqrVE4PlBHBY/oQ0j9+I1OlbWFBIXQEe6Rpd9nHLNe45cSf2IJMxImvHv0Bdag//rqZv+BUIhkC1wI+Xm1LwYanys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoLQpVIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmp2Vhak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoLQpVIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmp2Vhak"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3VoE44059895
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=; b=XoLQpVIu2JFCkpgk
	Bv6CmHskqbaYyr6p/lVsi1q1mMc8fQQyn1t+vfskkNYxxgMIKsganbv8riY2Ga9S
	auO/Ni555lvw7C9C5TNKWvf19XMRJFsP5Aw5mzjUrC0d5zXq88ZxGwFrx0XFmx+H
	pGb+d9PZVNujRcd9nIwzNcTrbNQ4udWpjlnKuAxau8G+DK10nnfr8c0h2mCfaxX1
	ZHydj2YmqDQq7+kkpEkq6zjzp+q2KXGFERctuNYO9YwkVBRHSXkjaCr/xB7NZsVh
	+4IaJYSXEVMxjZXH4EFHbuxB1G3z79OVUfABdNP+jdR41xKBi1oNbPxTTC9xyJfD
	ijPAhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsks8tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d15c360so39954511cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345338; x=1774950138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=hmp2VhakTusdz2/o1mT+QwqJOboFmITYFVHzUP95w+HIT33IE9nGf0oixKzkRURNYz
         +QrKFk723sAzV6MUi/9VpUYTYxZVF2nREME+qm+NWsffoapcpb93YaZh2mgAAyDYNwPb
         jj7NZOR8uhNioWi2h/OrVGA9VTWqu+LgPkuIpYcIJhodcEEjkP6oowKUr5+pv0Rc3XOc
         2hxGfxZ2zcUmqfCdkLNr9UaYICg//pvPjjnQr9L+M8dwAT2GwMV+XVzpJucSzeRkC73O
         0AmtLK2xyu+lUQYoNKgSfp5pk2v1Y8TXfV6yftj0uy5iwMv3h6iKKWbeoFJfX09hCjpC
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345338; x=1774950138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLdO2NSW3VrSa+nqvNmV4F8s9FA7/pXmbBVNZQcuBMM=;
        b=diY+H94mOqaE6iB1BrX9kkO/0aLujKNhi77VmBXq0pe+pFtC2q4cYKga79pjPBnEF2
         gsiDKi7jJIfh+t6D94LQeNr8mbnIx7xHy6rwZfh7y8bB1KYYcJyhFKl94tIgIX5uTmTh
         8JDenOHFPbyTFZLon1MHTEzXTkNQ5DktKpaTMuV5QcN2FbWsomxR+8Sv1uC7hClOhGZ2
         9lHoxEAiLbq4rJ+BF7JbusjikRdxWFPobURdnq7AonvdAnkzafBwI+A7Lf4U9EmW4BSg
         ianExiHhIWNDw3mLDmDJofeqIyfeznM9hVJEn7ptWYpiiAjhUjcNZ+zqYXuOgySkVbf9
         sRvw==
X-Forwarded-Encrypted: i=1; AJvYcCUq3sIFShk2ip/PrbMjk+JbqZW+dj9dcyNed6frl35SaX5qnV606NH/r7urGBeEIAXxLI1uZO5oIObi7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyawLDqmRFteOAZzBfR7Orv6ix1Wcir/Dgz2ndKTjR+j3d2FqRC
	RXcnF8Pt+8t2qHfoI0YAtaLq2ieDLlWvk4cgxUJDgwNHTfh75dWiLbXBq7jkY68T3JHU0LEE3FN
	F3Yhw6kAXCuKYadxJoglHPw4BzJYU4rT2VzwihRXwmMT8Y00tZSUmwpNyjQqVJlllzg==
X-Gm-Gg: ATEYQzx3doKWdiA3x6vcDgNv3s+K1p9iA+qY/hsOJCHeMsXqVplKz7IDvcxpNP3BnA2
	9NSKW9G3X66HXI+YkKK8U1JyW+Iyvp+J4yszAVo5WQlPdiwWjRcLZaK53ff+Gll7GtbUaW10kvj
	yvH8neo9W7eNCXROJ0NQ9SaYuU0tvZ66XkVEOUj/xotQBN+MgPkQYLI8gJr4hdYoPyR3z314lbv
	pQmyaciPkc5yXwNwV8KGOUJqyEphgC5EDvJK+mEDPAszF60UekbsHeQHXf2OMyObQzXl4Yt3FPn
	Fgg+wZ/icHz2s/utOodH0WZ2XvRGYTkSNAYRBJMw77LgjYXTkyOn9rrK30EzwLepzxE9ATOJh61
	RLs8YlaybdMkxuWQEq+HLUW6UQCa7ZimiaghOJ6CGrreCyJUFur9lGcVtnEw+TcwdnvtZACxFlr
	ztYxQ=
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227671cf.0.1774345338226;
        Tue, 24 Mar 2026 02:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:509:2239:8b46 with SMTP id d75a77b69052e-50b3721a55cmr160227581cf.0.1774345337776;
        Tue, 24 Mar 2026 02:42:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3e6sm620451066b.20.2026.03.24.02.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:42:16 -0700 (PDT)
Message-ID: <195b2ec2-d51a-42b2-8221-2a60823f8ea6@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:42:13 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
 <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
 <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d51b237c-8079-4398-8b8b-ec6a6876b173@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX/5M73a9sIVgZ
 TtWeIFEcH5NA3Wvqmw0cifZzVaJtpQbhjl1BftWA7xalYC0loTcQzOMXshonwc4fGphCzPmDg+o
 8fl2UjqhPnhXzGMiqFN/l19UMluiMxsgWpr8t8y9+VSSvowR3m8gPiQSR8mEwht8ncPvpnxi5OK
 imAEwGcN0v+ysGRN8Ed1PokVLDgG5VS1Gh2o+XviKUMxtXb7gKB4lHYJFR6JVnjhzjRY3CfFGCa
 jhNXtnKi7pJKWu+fUSpHwG0d2+HwA1igjeKHrCyZFqF//WdA3lImtZ7xYRD9jYzziVVJFIXnzD9
 8RMpmvJIHliWgfwYpGtcteCgFD8GgdIaj8Gnxci7fQtIkMdJ2xXiF5/ppSk+tT3UEsKTxqbWUd9
 FtJ6EBRgndwLzhfMX7j0ppFv71O4Qppr1nzvmOQzr9RGlzsjnf0XPvrA0DIJKyKWCbkK/AZNe2R
 dS6U7BHw2lD1pKQQycw==
X-Proofpoint-GUID: m-m2lWPiciJokSADLOPGdwFloSxQyGEN
X-Proofpoint-ORIG-GUID: m-m2lWPiciJokSADLOPGdwFloSxQyGEN
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c25c7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dZw9lnDFAAAA:20 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oSXFT4061vmgito90VsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 12:15 AM, David Heidelberg wrote:
> 
> 
> On 23/03/2026 10:56, Konrad Dybcio wrote:
>> On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> Sets a higher rate than the default for good responsiveness of
>>> touchscreen.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> I assume this is in line with downstream (i.e. you're not trying to make
>> the panel IC work too hard?)
> 
> When bus frequency is not specified in DTS (which isn't in this case), downstream set i2c bus to 400 kHz.
> 
> See
> https://github.com/SHIFTPHONES/android_kernel_shift_sdm845/blob/lineage/lineage-20/drivers/i2c/busses/i2c-qcom-geni.c#L894

OK

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
