Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7353DCD88
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345215; cv=none; b=KTUOpirL3YW2dzPYbt8pbh9Yhy9LsnOQBDlGIauCVn/MiBe0fGFgcwJmlp+vOAOd8Ikm+A4wr4E3SzBUTSPNoybuGfHSTQQLHa7h/1Xcdl6lQOKDv8vyQN0GF7MnQCpiNELkGL2MvVlT50qRjVeAyNly8UV6M1CU9Jmw9CiRHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345215; c=relaxed/simple;
	bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/vvqfPC6yR9SE44qwao2Zqz//e20kmLIUMa4Pj/RM+n43vCpaaGlM3mwL9+lNfgQfSyGJ9PP2lFkdO/408fGRQRSjLC26NchYMue5rnBokFz5ir5aZsLsdt8sELpIWkBSaXMk4NQnGrwWS9vDmuULG5och/j6l54CbhsuTL1rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYikzRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ/cQhTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYikzRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ/cQhTr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3pDQO1908895
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=; b=RBYikzRFVWKo1wAd
	3dLqM9UmVoyINmCuBRBa4N2rQecXgbGq5vbwARPO9H8rBCT8XW2OOcgsqzwXkFA4
	OcNoSR+OdRb5gYL5leBnjqsuA4/qF7wBnxNXJmWaGajp8lJ+kUYFgSZB+yfoFxhx
	o1XnAQfQX6Q5aeHkADrvap2VubKWugr9Y3tUJZj/S7HJ2daYPQyYw8Ix+F63ac8W
	LFShuCZ7g7HpwGdxfww4z6PrJIga+P6zyrPQ/NMdqsLS5lIJ8+aYsMM0vAMiqaXK
	n+L1P738qfm8g3nO/bXdlh06bWG68RpAkA15A5tyUHnQGxBLthC3VBX4G4gFR80n
	IQvENA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytssk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 09:40:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b32feb719so33480411cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345211; x=1774950011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=cQ/cQhTrrFvDdt+rN879SKTSSTvxb5ergkisBw7uwSBFvDx2jwYRMML1TIwljO/H6w
         T5J9DJqSvwmHhgYV7faAKFLonXlaPV2+y4MXkJKQcgUXZAQZpP5T2gK87l7hiCRvhOlR
         PZB3CasnjEvSf9OaC2+3b8x8+LDf5B6E0PWX8WQbb9US9M+Xas3aloo5ehnGCTTTIQi3
         VR5Oil6r9HJf5yeuYFr/4gC8Phb5RqsNfFdP5LSuwdltUSlWAgRdK3ZQGKvYygobZi3X
         LCgezMyfKGEfp5Sh5H02Z339+XbWrfFDcCG4Kcb0W+jwi/dMQd6ijoZMyz/EoawSewhk
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345211; x=1774950011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uc7ynKnBa2cVdFR3AoM/dcdGWzEDbLy6jc3DroJZxQ=;
        b=gpjN07Ce/rxrDLFM5R5zaDtOcZWSssGXbrWO6YCbXMPq+p55jwtRC0wx6mnpe7Sb1Q
         dtGQlN4zm/0oXgX2dLKWRD4c8GeNeET06fTtSjhl0YeJGmMrcUi81BADwZuNwzuxxFZ/
         c4dfpKBvgguVfGozKJbJGgZT7b3r9vU3uUMhG+6z0au/QUFsHUzG+3qnBNERobPAW3Nh
         DOOWvaV4vUx6vc5Mw57F0zEzOwMhYppCXJ5kRhrxotWfTEhHiFssx36WvovCK/ClagD8
         w4xT2abkaNcsFaw+gvst6744TAWCYgngGp+AiCRHhqrg6IuFHMtypqTVshcCCj/dLVwZ
         tIew==
X-Forwarded-Encrypted: i=1; AJvYcCXSj7x8thICytIGt3J/W9PxRQq2qRuxTx4AKyqREfmIVvo/5NP4cLF8uDYlVLjbi3RZDICdyqg/Ta0uhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9jp37rVRvYd53sw5GiGYwW0tT/FGCijf1H5nHgKqdjbPm+0O
	mCmin/jnY/NVTZTMT963bxPCts3OwJpjClvzSD41UnilSRYjbUL987SEB7GEZWEF8FmFb5Bwq76
	mQy8tWL+tQG3BNsZunQZKcJW/a5Ux2bSZzcOtETa0mfCMcLbqhPSB48XB61fLlIM+rQ==
X-Gm-Gg: ATEYQzzHFzOReomdIJ7Wot0kscYfJXYIWY2VnLyoCVehOwSgxw3exEI4zs+GfjBPvv8
	/Iyi+UIQVadwY0RrS7SYi5eIKm7DByPKHElxEOMb4yiYWdezdPeJjwKf5xxUkSzs1R9H9iip31s
	sNdSrzf51QjeIzoAY+tfZpxpzO6CFDRgRCHqCsrgYqtYXR5/f9wxLVBSIEvSRFXzKjmJlV4i9Ft
	sw0bJHwG3fSORpRpL+rZ16iiJPo544hmMtAAI0VtdA5odA4C6YKrpImwLwI+QZy6jPmSyU/NxSv
	3uA3VMv/iP8PXtUVTGM2FrE485u9RsA34ZsR8gsdJgyCVbXp1nH2gnuhWEwaqbkf+v9LHIlA3Mw
	Gsj6iLRwGp7VR/7gsg09usETLGK7lsczrGWzkAwnEy1YX9Jd0ovnfG0WV8TiDasui09nI+C5Tgs
	8UKEY=
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543561cf.6.1774345210736;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr182543191cf.6.1774345210210;
        Tue, 24 Mar 2026 02:40:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm613580166b.62.2026.03.24.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:08 -0700 (PDT)
Message-ID: <020a891b-209a-47c2-a769-77197a257098@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:04 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Amir Dahan <system64fumo@protonmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX9lzQyVUdc/2E
 HN46VnJ95n1oUk2RMlTKgiMA1Y2+erJFiy124q5Ts78BNKUfxklXxGpR/lYnWPc0gI1GpP2oFNA
 DMxexUgdVWfQgFGdbeQ+bFsecVyYu3uLb4d72DrwAh6Cx4l2VttysLbo1A98Scjf3hy0yXP9rWH
 LKcxgz93ZzS+jPii7uSYh3wVRsbwEZ2bJwnTjO3BBvDPqMzGGp9zN1Gd33sjCkk9XQWcjdtYtx0
 M0A1PUfxw3y0y+KUKPI7Vq6oFq4eWBQ+9V5CWOVw6mBXpFLYZliW+Idkm3MHA/4gmUvEUsNOBLW
 +ihyK/8OL/Z2N2J+jfBH7zzFfdIjha39h0khQjrw57D6dZNHOGg0R6ATdTG18TtP3FpaqdlZlqB
 XGh1nd0CjqEjS0LHMIJSDuOUnGcv/6YK59z2AxgsjG4unI9GUTQmUausVRmFPTSVCx1sMOehg+f
 C94cje2n7QN8Cd49caA==
X-Proofpoint-ORIG-GUID: QQ7v_llNRBLRvWELyhfpp8RCeBxrg14r
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25bfb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Vgcxg6LKE1OHo-dCjS4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QQ7v_llNRBLRvWELyhfpp8RCeBxrg14r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 3:13 AM, Paul Sajna wrote:
> b4 got rate-limited by my email provider for the last 3 patches, I'm not sure what the best way to send just those is now :/

Send them by hand, --in-reply-to the cover letter

Konrad
