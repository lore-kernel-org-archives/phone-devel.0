Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B724325499
	for <phone-devel@vger.kernel.org>; Thu,  4 Dec 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839829; cv=none; b=DmqvFGP4Iy81UbnriL1AzYWrnFNBVmH2bPxW9tSh1RMIxLFVDWKLnrE+4q7mmH0fG+7G455ZG8BOFpyqL6rMvLsPgjqotcQFlPbhsDF1AQltIw1PhpLbHRUcTPyeSaT3ffuQXUyceZOsZQcXCe5dDDPPIQRa6ndsksx3dfZRCGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839829; c=relaxed/simple;
	bh=SMUsPkXRZIEHqd9ZQP6HWjjeIV6tB257Bo2GR1en/kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzXO32YWiOmiXiSjaPV5f0VTp/VvpprZxugvehAdfdXqw5MUa1v2oAOvVMtcaCPS443UD3TAHvqCnt9Yo/0Cn/hBSfGLx504iSoKm1olBbFANohkvQCPaM2j9usaCoyQefkdW8AELlm77lSoZRW4ltqRJEKuUJi4r1/M1rsWz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnL96wqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP+DhpPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnL96wqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP+DhpPh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48V6rW952079
	for <phone-devel@vger.kernel.org>; Thu, 4 Dec 2025 09:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=; b=hnL96wqUN829L2zt
	aeSg04edaoGf/6r41/ZSCLRUlTAHDDKjurAOwRnz8My/48G0NdCESRAjG0+AF+wV
	XfDAiqXGZ+vDOPay1/bp/obTP2panak0PSc3z9+NYthhUHMuloN3aRLQaq7rIque
	0r56LG6P54HNJAtbFhCwx4s3QjXjwo5qa6f9dd4MK+K0SPqPB+xJi71yVB675cEz
	VlaGWNGCc28oPkUn5jhoOpQUbhNhhehdOK255IZQKAiHRVLOmDE6rHn+gr4Rm6aF
	L6PZxb5L1GR6jxMxJpZXl6VydvCY1r+s8qsDyT0+2oFxgsocyYv94vDDifztbpTI
	myuK2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1g4vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 09:17:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29f90f9fdso18196385a.1
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 01:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764839825; x=1765444625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=;
        b=KP+DhpPh9Ep0YK9HWklaUAuM1Auxcjj7vDQmlSoBGw4/XSBl7I3xBB113gi/NgkAMy
         4SKFpXSXgFtoarEYaljJtxU66oAnFs8s7TRLGUMsBSaHe871yJIm186HO4RXOD5jqD2x
         oOqAChvf+0kw/KX4Zb3pM2XINJsAoOva4c5uwfTyiCyatbAnnuWoeVvmyvFatBEDkT/e
         gcUBmO9MIIddAYEqqn2ruhYXt9IYXCxR2sM3+ua2AzpJ0TAgpE8CKp8urpy9/wi/eJ51
         fclOcpjfh6dRWu6SIYGDdHhBVUygDVXiGyO5czNawBihwUa25QNRaGdGpERrukiEhGQ3
         Bfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839825; x=1765444625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U9QIgJeX+XL1L7BzeMqcqfG+cdlqZzZuVJJDQreQ80=;
        b=lP3YUdZEiDmPLjAdlI+cUNHOpKy6UqZZ1e90skZerPSTLWmcpbhxfYRUwdsP7Ct4wH
         KAvrB94K8BoZxfx7BgPGCDvsZBrTCEi/DVcUP/gzuzZgxB7xwy2wajirp4vfWik9wEeg
         GlOkWFmapDXjtq/lBLiXkE/d4znbvjX4BJMzwDKfoxkKyRBkNoMIEpu4gZtcRe8Df3tU
         GrYWvymxYHrYntsfM4TEtovxh81wkMfr3XqrC+yuEvyjrlTawYEpJ08So+9Uo5xTatNw
         IhVtzs6sz+rmR3Bn//3zv3ARUYwa4AjN6EeRl0dbjmwNErOHCiH/DvLU5nWXERo3LxGk
         +INQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwG9Bf/MDUhM54pR+dxW0Vv0lDclAG5nvp9NS6W9ffza5Tk9jrj79tzSkE1QEtb241KDsL14Iq06RfPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJND2J5jNg0UsOEbt2a8k+zReY07sFL4CvZsaD/arf+0c+zxh
	4kHbjZ1SlExfh14nLbtFlzPE4GZahwhqYbP5ClyR6WT7iODhWO3UJ760u7kxjeZuKK4kmrf+QIe
	nawr1U11NBIoVo5gnpoVBbuAFNZIZ6Ryqyb+1A757LjcUMEfXIy4sdlpsHgC69HQWhQ==
X-Gm-Gg: ASbGncsR22m81Ve8tYF4gSqED2LqL3XuNT2vzG2s2+rlTU2lFsQAPcDqI/ac8hmjcHB
	DDCtZirD4so6gsdMt+LWDIxy8qyyfQXK27ELAq0A59H6n3ezQ9V7zmFGXU7HhgOMfnj+ZE4wo7B
	v8UsMLFnBCYF8XdhY9/KfFA09B1A1K97IAxNrfOcsKC67lGeWNmF5ZxSYVnJpiKfxpHjfUZc48t
	FdA14qukgs1aMCK9fZWHkFF9xoh+/Go0+aztACO3zzuXp6TMGbeCWr5T0rfjcot/ZeUW13bCizm
	J3cogE9eaWIqeFSKdQ6uOBRWkb6alwVSbj4XbGwFGCFkq50f7sBTka1dHWS/KgnVZrnqQfin/8w
	T2dWrGCWOA9SH1+aeNHqfYbsP232PHDDUWFF4c2JxiVG/sXKvBVTcb2G64gKegashWA==
X-Received: by 2002:ac8:5a06:0:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4f01b14cf83mr50517591cf.5.1764839825338;
        Thu, 04 Dec 2025 01:17:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQLbXFzWb9OJZU94vVBhRpTXcpQzIV1HSqq5xzJ0QE2TLlv6RKK34659GBcDvh4F14hpF4ZQ==
X-Received: by 2002:ac8:5a06:0:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4f01b14cf83mr50517271cf.5.1764839824823;
        Thu, 04 Dec 2025 01:17:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2ff8sm796987a12.7.2025.12.04.01.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:17:04 -0800 (PST)
Message-ID: <d8a3a30a-d627-4085-bab0-b73a2eeaa12b@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
 <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NSBTYWx0ZWRfX7c/jBwIYf0Qa
 UnprVxOBJncJAUSMgiRhfSnBjkwdBmRCslhlKo3nOZ32xzF2AsElp1sjYLHBYKcEEKE2n66now7
 X+KvclTuhtM6RF45W9lZZJAL1YRGKp3Y8qoFKz/WzjLtmVmu0AZHFt9v/DOYRIUtdy+VQIC2TlH
 3SSkHRrj8ov7ocII5OZLgufU4ZH5gUGfgqOxI1mQfxTxkyBN0t0OjkI6WJMXb6z+VwAU4uGpF6J
 ziIwFJm6yAkpo6hxVFNKj8bCxK10p6TZTGPvL0PBUPH6iW3S8Z9FktdRbtYlXvEH65pVwidGnxk
 5e3A3NnSZ7Kzi+713F/NJNzUSwlAYKsb/bw25Hlv8GaeWlLnS22yrKKX79py4vihd9VP4o4tKNl
 OoMEVAqkcYB5Lz2f55nA0TwP/wWQ0Q==
X-Proofpoint-GUID: 3YTUjbIdAyTlC4bXNiNzUc7jhj_B_1pJ
X-Proofpoint-ORIG-GUID: 3YTUjbIdAyTlC4bXNiNzUc7jhj_B_1pJ
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69315192 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ubcZd0e3b_FObW4-F2kA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040075

On 12/3/25 10:27 AM, Paul Sajna wrote:
> linux-postmarketos-qcom-sdm845-6.16.7_p20251203010632-r0.apk
> 
> 
> December 1, 2025 at 11:42 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 11/28/25 9:20 PM, Paul Sajna wrote:
>>
>>>
>>> I did more testing on this, and the led only comes on if it's brightness is set to approx 150/255 or lower. In that case, should I set led-max-microamp to 60mA?
>>>
>> FWIW your downstream kernel sets up channels 0 and 1, here you only
>> enabled 1. Taking a look at a picture of the phone, I only see a single
>> LED on the back, so perhaps you're (over)driving a single power line?
>>
>> I'm not a milion percent sure, but I would assume the current draw
>> *limiting* register applies to the sum of the current going through
>> the three channels because there's only a single instance of it.
>>
>> Konrad
>>
> 
> I tried setting up both, but only the one that was mapped as `led-sources = <2>` seemed to have any effect. Also it would confuse userspace flashlight apps if there were two I think. So I'll push v5 with just the one that does anything.

led-sources is parsed into a bitmap and written into REG_MODULE_EN,
this doesn't translate into anything that's userspace-visible

That would instead be the case if you defined a pair of LEDs under
the device node (which is valid if there's two separate ones, such
as for some phones with a back and front LED flash)

Konrad


