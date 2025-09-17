Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF345316184
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117511; cv=none; b=Hkfz9Xc9QzUzfRkGFMvx1Qz0z4N7Fv/VveNj8KNNtSE0CzayMLaYpJ0fz8i2+WaRvzYNlmfg0hZblEkhC/eUC+7yIyL+/CL0sLzkFxg61ORYYusIjMA15kkIDFDu36aE0nveTLnNc8paR79WazF38gi6Sol6i5qZO0/Q/cURHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117511; c=relaxed/simple;
	bh=Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKfcSiuqSl5gJKIua7lB5fFEg7GOoZWS5sbwW9gh69tzlFhsgRzgee5PC1bSwCjnGw9bvc2yO3f2xxzuB75xeOHa540ArTiIPzVn7mZ0F6MzPHo0V7uKNbK/wF5UgaCoGkCcU2zKhV5l4qa/3IKaYfqcjg1qMCHQh2tNjkL/zFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qu1omjiP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qu1omjiP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xarq029900
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=; b=Qu1omjiPBZMPK5BM
	2mIaADHfORtt8Ze1D5YDpMg1rFc1sxF2l7DUQQKzXNtyNtH6MokS9k7Xw9nrjIqt
	tWQ1sDJF/pX3kPA+DyqmS4yzz5PGKhoZqW5blyvHTJRrZQWqio+YoaKaj/vX2LOl
	ZvG8HpBF4aGVOd1z8LQlHkfnvGFmVkQ5EeblCw9i+EV9MQA2sNSU1fWJUqhM1K+z
	YQCk706dKfrI1lunxDa9YmV1AXIMKT7+tlhmbO4H+NkZKy1hxzwIR9kaAQ6loEiY
	CqAnbJsyQ4l6RhTVTppRwNI/X9UvppfqG75yiDG2APjg3AcB88suAMes3p7ZUufI
	MzBt7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxjkw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:58:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b79d4154c9so14500791cf.3
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117508; x=1758722308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=;
        b=RAcg2BBkLPMadMn4Fe6f5s0BdrbfEjQ59m/3CzZ0NAFshB72EpeTCQNtvA6A0aZUwq
         GRAMsTC76WAXebXJgIm2arclHZ0Hvwrh1JZ7+vhCPwEDUV2id7IYI+7dz1Yy7Cs/tjWb
         aQ0LOnP9unn+b2VgoTsH44lf8NrkVkfF3HMy7HgeZemfkpdsBTLE3AKEa54lXe7xMNxY
         KAPereTj8Ks5qXhXnN3IaKzSDnezi/NfZvj+v3HScTP/UOoiejDnkNynve1TtVVFAKNa
         gosHuJBJ78WtJqc2V0Gqu3NEIiD36yD3q9jlWC8cq422wNjEkJ8tMamQCjh433Xc9ut9
         kZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2qfXVhYoMO33ol4DS/wBU0qCPB9No+Vkl/BYcKSikfe2OtgEcRVCZZgdCi1W9iW8vrdlySS4GvTu2Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfuFYuIpniITRJsFdlXnrDRWvjFl26Scp38egzdIVIcg+oinp
	MsdDgOgGg5aJSeph+QFHWChv2Af7pbwcT0x5Tt8gF5UCSA0baqG6+GqpleDpDCFVUTcF+z9zVRl
	swmRHY4XWISQi5y6Wxl45sdGm/OyKOqeGCNki98Khn6fs/r34H3BJy/HBt13iZ/3T2g==
X-Gm-Gg: ASbGncvRGzbGXUVKejA2EbdlR7ib9HBDTWTLxmeg8rAV75ghsp/V6lAfUryzEZ9M5Fs
	9m+2uyj1OvAdQVsmul9xIqGqevSpfcMYi8OiyUOdPntTD2bmBT1MgC94eO+qHRc5YmBLFpRisKZ
	gsKGUADjq2bOxdNBu0NiS0UMFer3U/rV0XdAZcOrbkMtknwDpDUga7EAU3kBP61SEtWH9WLG+/u
	GREN0ImgCmHar72bbmAj9LdVtj+uWbV53ASHF603al6qDFT95EOt0BHQWvkYEMLDIvTjBfZFzsQ
	1/DJ3rxVQVgur5E2Y6SbJmkiNixpeILxYEopIoGGb01VlDHRYh04oC3cFsrkjd/+gFKt7iuJv/O
	5P8MC1KN4o+ii/IObXkX6Ug==
X-Received: by 2002:ac8:57d2:0:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4ba67f63fcbmr15850401cf.4.1758117507673;
        Wed, 17 Sep 2025 06:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzl8qZRgKO760HE5SG604Jpiu8qKnn+9Xk5rimSB3ai8LQP+dMPXzzzD0y5Mr3IYRJFxpE3g==
X-Received: by 2002:ac8:57d2:0:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4ba67f63fcbmr15850081cf.4.1758117506982;
        Wed, 17 Sep 2025 06:58:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f9a7d8793sm308788a12.38.2025.09.17.06.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:58:26 -0700 (PDT)
Message-ID: <56d34704-aed2-4c61-b5ba-3cf3c91b2806@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:58:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] arm64: dts: qcom: sdm845-judyln-common: Remove
 framebuffer reserved-mem
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
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-12-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-12-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8ekQumP8VCwP
 hr9LhIqRWnazcR650kbfWWTDmycIqMZluIwxfFk2PhqQ0I/lLgJCF1VSJ3kwoUBsIJj/WMPBj6Q
 ZJdDRuvCx1BpeMGh67uElgm4m4JM8jpmzozhfAr0fk9yTKxwhAr8PCs3uk6ZqsrNGBmJPgPB7Bw
 P7HJznUgcml5vRP2CtxOG/6CGX168KYoCTitlA4IrTv035n589dxYpQ+UnxRkJSUAPTbqRXLSgQ
 9eobvnRVn9fpCNTKcdR8uDnFy41IJTjgtjqhJx9bZJ4gh9cVKInB/lxG5VlqaB8zsnjmooCV/bm
 nOPQmxNUme7XJBFBivyIzMX5dU00rUM+OTZ+FCf7bGwPT3yJwPdkgOtrCmQjjGSFOqUhtnUIpE9
 nMBY0eY3
X-Authority-Analysis: v=2.4 cv=MMFgmNZl c=1 sm=1 tr=0 ts=68cabe84 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=lLqmTuED0iPNNbIZDJgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: BI0W60VK5HGe3pnyodz5fL7e4fIe3v1v
X-Proofpoint-GUID: BI0W60VK5HGe3pnyodz5fL7e4fIe3v1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> It causes a conflict with simple-framebuffer

Huh?

simple-framebuffer even takes a memory-region reference nowadays

Konrad
