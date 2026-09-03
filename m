Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BF411F93
	for <phone-devel@vger.kernel.org>; Thu,  3 Sep 2026 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423048; cv=none; b=p9uBAXHvjKdImijObuxA2LDotMDu7RDIx3em45aQeKcJC6HXc9fp0Dlm+XLiPsvG/rtfVDqfUFlVuzejhyXC3Z3HjC0WzjXIEVzDz4qQ89viCNRu/NLhbyUSiRQUAO36beuUPvXRqYPV17miM/jU2E8zMGLSoo4CZoMe1JJwIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423048; c=relaxed/simple;
	bh=b3aHP4glpbl5TnB+5H7BPBdBuPy7x4QVRQrW1rbJY8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM/y8FH1fu0+nf44lrA0OJKvSlrnjBodGBgnHqxaphfzfX86j/Rp/6dmNU7Q3eiJB7w5dCuCXjCJWMUwFRZpbp0IYnyw5BbSJm1hl2Ut4HZGQXze1sKtEaod8EdB6rZz/aT+ykTuuaLbPiDULNMAYhV8BO/wz1QQeSmIvh2HvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+J2qPMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqrivUn/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+J2qPMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqrivUn/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLQX3113940
	for <phone-devel@vger.kernel.org>; Thu, 3 Sep 2026 08:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=; b=n+J2qPMUlKB8Axu+
	/FzNqZn3cIK+jrEKtB9/xJnmyShpH2cWduaGLR58QG02VPUnDfskp3+y/UFJQuQ/
	QeHXA1fwg8VfKku2+1f+P/M+SP04MuuFdrdrfCT+PtheaHponlf0UoDtUDj0M7MI
	CwKe0I4LQa1IZGi7jcB2Exk1KCbsRcm5gagwJ+pnEsW2FDyRgmoc9cXYkkbx85u2
	4WshPQEoI77O/pWuezCRRX92sbmRirXr1wdYfot889OQgQXKto5QhDeOw5kPPDTb
	m+tkxxAMImN1oYWKmu7/4LA7ZWts5Y83ilJIWzGg/CSoLGbLJeThqnHkPCDW2O8z
	fcdU+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs2wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 08:10:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so47391285a.1
        for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423044; x=1789027844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=;
        b=iqrivUn/SFYlnVDmvwf3ykGCWHpnS5dNjh/xyZU/qWyv7EJEFsXKS1IyPU4WivTWwd
         9N+YHSRFE10YUoQahk1eqrgNeQ8ysNGtu8+3M/LG0hmFTGq1OL+3RKfWf+a773i2KMcl
         xXpOuQz1s8aJIdV9UfPMnu0tOL+RjTfASMU7PpdY+EPMEhHcxwNc3gjM30t3SrWZM00G
         Wc1+9/0f8l0ALA1Q234Xll2MhdjSbDfXvJ0xnw6vGPlHCGZfQy/jFRfBVtClelWdWOyP
         zC8jUIFmLJxoQepyFEy2YTKxAhFtf+rvE/fJsQu+mqmKXHMki6+BQs4ecXf6OAX0bw87
         ds5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423044; x=1789027844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=;
        b=fGEYKYN7ERnOqfMEzxuDZFoLzVIvL1heg+uR8O+0b41JILxuA44F4/Sd4VVSwZ9NcK
         SKsl7RDbSEEFJGBk8OtnLzakdemjjbf4vHujvbmu+KPafRNL8deRmvOMIpmO++V384jx
         c2z5oR8yn14yrle3znMsZP9fQyuXv46os+yehkv1387I4Kr1SOEOi1PFWpym1CC8mf8M
         C0pAiAXBOvT4zvzyzb9fNt0XLGdRIL5Egh663BIxerpdg8ZmpkHUmdR2H/DPfjcwqsbP
         otLw4wm88cRPSHdiRowyLf9fjP0wrPI/otibd4tAHXh+ayWtsC6Pk5JSPQcO3sL9Oplv
         ToCw==
X-Forwarded-Encrypted: i=1; AKwUvByJc2qe0vgSYd2DxorYWIxC5GApXwv9Z8NcVJU5QPhB/M4T/0fU3FjCCiigwCkNATqD+OAG1+ur8Lpd2A==@vger.kernel.org
X-Gm-Message-State: AFuF++mLcqHOE6NNdaXIIWey4VaiQAWzEVUaEz4TeyHuBg9dWPGymeOM
	CH/djQauZJshsofAvIBT5TkAyZR4/kYshvqKgOGR3nvfad5k4COJDT4RM02Pi6dNwkQ5uv6pXW+
	0T9JBdMGKSNOjh5fIQ3jNyAqop2razIaQsjrr6RsRE+zwU/ewWw3YQP8i53Gwkt+9Eg==
X-Gm-Gg: AYBFou3bYsXGsnsaSsKjz9LDdqat0L9MdnhiYdfm2VUyf72bcxWf+x51oZRTwTchwc3
	AaM6mrEK/xAGEqc1/kxMuQgQfFREJbFuEg9WIDR7E9SDWaBw/qK+10AUTu5mqnFSd2jVksXXgJo
	se4U6phn4BXYBlcTN31nsDNux3uDQY5A2XM/UA1JBveqNWMOMMIPRCXo9Wb1cI43Yw8BQXdB17p
	8ON8nHUcODCazIAEgGrb3Gd3LGaGAVsBa8SpGsbvo+YB0nkfX1pPkYZ+KXMDUBPoZRQ+A3diRDk
	MpYhq+6YvGGgr6ZI1ZZW3BMYJdzSVsnTOGoUEfXNUHB7qeKmB/PmfD47knhg/E3Yj6rPgeXxkbm
	JSBl9hrjMaHDYtot5atXEPA==
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr363083785a.0.1788423043978;
        Thu, 03 Sep 2026 01:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr363081685a.0.1788423043577;
        Thu, 03 Sep 2026 01:10:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172626sm60991266b.16.2026.09.03.01.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:10:42 -0700 (PDT)
Message-ID: <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:10:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX3mO5ul4w8U+h
 BMVKl9GpBf8cJRSQp8pi65GVloGl6y8I8bkEHZYBKu/a6B9VSsdBWkHmQQk1sqZHrlHQ/DRTDAo
 Z2fgxxTcCv1O9fXA3NvQkBWwh1OQBHQIJsZnoo+CAaFSyt3vH39hOtYY03S0TtwPiVTNBaBVJBr
 Huj2mXuIoKopu+PL5xhnHQWdCGRe2EnIp+qihzEkfj8EN3RFcpWJMx8vm0+suWx7GCr/WV9tSOl
 VZq8e3cP9y6X4XzNzHJvwjKYfcQBTd2RhTRANccUTTu4alncI1QUxM6YFcby/kFcxeqtbtAmVg2
 nH0XnFWu0tg2Ukw/q1I9ceXtTE6CKhaqblRhvILyaTnXNHgcPwPYqFeDxrjryh1eFcqLgTa12AT
 IGulqNmAawXx3zp8jtJxa6dATgPUTwy3A1ekDmqlmeHCux5h4ZJTJKl6EyP0Ne0AC1lBx4FpOgo
 YGHO2SeVG0JkyY8L6uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX8w1wtYzIOr7W
 PnpnDr1D6zYu2rTVPvxTMvVxh1A8H+7KzwpkV1sfo9Sr36hza59oiwA5frNzptatWixXVk966Qe
 oC+8qXmWGVzQZZYxpcGPx9hw9DSDjcE=
X-Proofpoint-GUID: vllkFyNS2GVs3tOTq-KEZHCgM0wKV9uS
X-Proofpoint-ORIG-GUID: vllkFyNS2GVs3tOTq-KEZHCgM0wKV9uS
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a992b85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=GcxSr_ZgTee_yd3lG38A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030071

On 9/3/26 4:03 AM, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

[...]

> +	nfc_default: nfc-default-state {
> +		pins = "gpio12", "gpio62", "gpio63";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-up;

active-high pins and pull-ups don't really go well together, please
verify that

Konrad
