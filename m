Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FF30F533
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458302; cv=none; b=HsfmmNaqp64rokH42UtYuHfaKcj/ppzN0IqmMQ9CTM289bSPmdWcrKFeB2sPXqRp4mLyxp2Yo+XuwojvljBx7QypoTgfC56AUOk45qSDSAcE7+VAE5xBuKFTpnItK8TkJuJ2SutUUqMP0JCYDvBrnko+fUm1DD4RRruZzv3Bzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458302; c=relaxed/simple;
	bh=xg6g+TbBMP5QZ25O5n98VNRNHQwYlKa+V80ixpW+TF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBj9en1AgIuhcAXddyDdrUF8i1YxCW2wT7Frw+By8+ZIfK5VeUu5x5J27vLeoG6qUE2SLQbavJ9cObdK4Tebaplh5C0oTdZW7vSvfWsSzy9tAbxokHOoMK+P2k416w4SKFqbtRSwuwRF7luntbVYFhzC23AB2GlL4isWysYLKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jujc6rAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui+NQNNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jujc6rAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui+NQNNQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8DtaN2194256
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=; b=Jujc6rAS0CjIDNnc
	4sDCoMOwgc9I2ihYd2cA6SGgYPEhxL9a/QfPQza//+VTgcJvJ/5pcBhvlieilUfM
	gakIcNvSZ+CgyQHxkRrhTcyeYZBlhEOoChEq71BP4AdDxgpxTUH9Q9ARa6mxiLhY
	LocIZdshHyygTvjhLyYBVjuGJSoHfS0ofGTRnoRk1wWINX+/HqegBcajTbzcuFyb
	Ysnxzl3LDrPqPzTLC1QqB3wDQjMpUS6q6AwD4S7xkHZmhjASRBuKJHgtN7TOp2c6
	WTFtVFZBEbUO1sH2FNkGfj54BVTdAo6I/oJh7mo/+SV6yY9I3BGHuR3T3QZRNmED
	1gVnTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y87xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:31:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b25c5dc2c3so146478885a.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458299; x=1764063099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=;
        b=Ui+NQNNQCq5IHPA08YzlXS2LGRH+L70xUD+vhIEruqLa+iBmqJPj63lsWxtDilDjEj
         WRPKJ5d2vzKbES3D/TZMeyoM0Fyhh9KE0oa0NLYd+3Y87pXNMbHBPqFa8fFT8PeE0XsW
         cm7JxjLeSuqNcEqlyDJyxYV1t2DmqA5RIdR1mRcMcPvCmSz4sab2zDQP7D3ozUkVRlG8
         5LNbO9Qs7po99spP7dt4TNNRyjHDrHRPT+uM2VV0iCqRbeN3Fz0z94dhTy30UOAEBkRV
         i5eTmswSqCUOurEsrO7upZ/2EYlWNJzhgSL5EVoXc0G4BEkqjQ3Q3nHMdv1EUijj5bZw
         my6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458299; x=1764063099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHouQDBsurKtZ9RdklN/mtoaAV1IQOKsjLV5itJo+Vg=;
        b=TAD3zccuynhD8FQctYYPHPHUdeUZ6o702BAgnSJ+AWiLgvF9mAEfrGWBgZsi8+H3sV
         CZB0QxLs8PlTDjM7uonTgq2i3/Nmx7kO0akfJWX1+u9sNddjGUoPC8Z3K/mY/RC23bY1
         2XZDJ3JMY029+dMZLx9/VTKBZVi/c4t7FqZ+EAjqnfQTPz+BxPkYKdQ3TKHMBnsr/wPK
         JS7wmRHR4nvXn6boXriid+8cIHzRy2iIyrSQz2X2Bag7ZUyY8VOr5CyTFSfbTZ41HUSs
         DaDGerDmczF+mH+gYRf1f1J1PJePOhKeD3Yqk3K9SrMOe/jJEwhhU/7j1GkpRlJm2G8w
         DsHw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Gaq/M2LhEgondPUux97SFibjJACLfD5S1UERbJ3TYCfFCwfSDQAeBe5r/GoxVwrNTVfMyzZSiKk0mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEjmtTUJ0+u0G0LbjOx3NE3Ui8Lfte3iunJW+bZqzgnAud4zf
	vcBd/4HxdKcPoZVsQZY8x0+jOWupGmp+e0xXtBt68NA/dPQZfTWXl4Tg3XcXggE736zr+6VQ0VE
	5bberFRB8HvPArcCznBOMc07tk8bkk7nq3Be1kT3/v2QOq6dErP7qnv1vuNByzJ39+A==
X-Gm-Gg: ASbGncsMgCNcIg73SlomCmDfFyja9xNXb0xnNkEQ9kL9Vs4qT+pcsiFF7mSJy/clYHP
	5oTlaYEE/QUsPHW7eoaBBnScnxuvwLL3Rk8PXDBSDt3dlSKT7U1WQwumONoS+Vxn63K+uAnXNu6
	Z4x7JHshDhohabEX/E99o2jSLTWTwAXxMrqkTA4frrKoLEquQFFgxbAPuMsPeN0IP2q3BhiQryS
	kzIvGYQKhRhB9y4+/cM9QfW+8G0yGjLWkXXg6EsPJGLAE7EDzunWmv4X+oc+4lnfQjwL07vG+Hc
	MHiqe5zQIqcRQcXbRFOX7e9qwlAen1UGgPzP1zFHFM+maJqcUbo9WaaPSdYZ+ikYvLw/zMxxi7C
	Cf8rc+QNgjWN/2K8olf/yPMahsokIjuXfHNLfqW1LMIQ50mPf6G+FBN4iP/r0bnzQAL4=
X-Received: by 2002:a05:620a:450a:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b305fac515mr156396685a.7.1763458298653;
        Tue, 18 Nov 2025 01:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8nb3LT3weyuRb37e8MaLCm5BKsmAFnUzg93HHxx6UWJRPrTTzKCAEqVFZQawQy9xkQSkOkw==
X-Received: by 2002:a05:620a:450a:b0:86b:12e2:28d1 with SMTP id af79cd13be357-8b305fac515mr156394285a.7.1763458298043;
        Tue, 18 Nov 2025 01:31:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm1308651066b.66.2025.11.18.01.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:31:35 -0800 (PST)
Message-ID: <92165785-c03f-4507-96d0-10442b67691f@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:31:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
 <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
 <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
 <7f686f1b-7cc7-428d-941d-82883decee49@ixit.cz>
 <259477b9-0e14-4785-91d4-67c5a94331eb@oss.qualcomm.com>
 <f15c4ed1-5997-48a1-a0a1-1b0113645517@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f15c4ed1-5997-48a1-a0a1-1b0113645517@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfXzNncG9U2lOOe
 OgXKuUrCx8evJSTDsm6Mv4sqBSTs/5vyycI53yqoVm2IaM+P/0Io+wM5tnlvm/n/VtTRnTnlYKV
 gYs+vBvJGZqKKipsWsARdqOybIYlehRlgEPOW1zT33eJJCTz+bpSO5s103lleRONLpWisE2MgCn
 CJqOY3k318X1gXBRAw6jM9QkhEz7nG8E9S1lmyqAauHkllTP6ZfT8ntRvfxp2dOroE7HcgVnZQS
 dMGpsJbP8xlZiUbKbvT6m6uGrrnv2wNfBCFRFxtN6fnTkNRcGEooZKuZWlYUj5M3ZJx/0NpJULA
 cLWheCKUVpXJcbNErcMKgiRxEgs6xI6+mp8R0WnRKANlq+zJD2I7+lT8FPgh1uPbLoOhb4NuORw
 m7DWYO1p1+CsVZFSg3jWBuNVdkPHhg==
X-Proofpoint-GUID: 2yD908tZlW6NeNRoC_uzY6rgDbZh1noY
X-Proofpoint-ORIG-GUID: 2yD908tZlW6NeNRoC_uzY6rgDbZh1noY
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c3cfb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gDn4PdyuB1kJIsieQ0wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180075

On 11/17/25 7:35 PM, David Heidelberg wrote:
> On 30/10/2025 13:10, Konrad Dybcio wrote:
>> On 10/30/25 1:03 PM, David Heidelberg wrote:
>>> On 30/10/2025 12:32, Konrad Dybcio wrote:
>>>> On 10/30/25 8:24 AM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>
>> [...]
>>
>>>>> +    battery: battery {
>>>>> +        compatible = "simple-battery";
>>>>> +
>>>>> +        status = "disabled";
>>>>
>>>> You added support for both non-proto boards based on this platform,
>>>> there is no usecase for you to disable the battery, remove this line
>>>
>>> Should I keep the status = "okay" in the board files or drop it too?
>>
>> Drop it, nodes are enabled unless they're explicitly disabled
>>
>> [...]
>>
>>>>> +&tlmm {
>>>>> +    gpio-reserved-ranges = <0 4>, <81 4>;
>>>>
>>>> Could you add a comment (like in x1-crd.dtsi) mentioning what these
>>>> pins correspond to? Usually it's a fingerprint scanner or things like
>>>> that
>>>
>>> Sure, I looked into it, but I haven't found (so far) information about the assigned blocks. In next revision it'll be addressed :)>
>>
>> Thanks, you can usually correlate them to a QUP instance based on the pinctrl
> 
> For now I verified that 0 - 4 is SPI (Intel MNH Pixel Visual Core), but 81 - 84 is at best educated guess SPI (Fingerprint Cards FPC1075).

Fingerprint readers aren't usually wireless, so that's a good bet

Konrad
