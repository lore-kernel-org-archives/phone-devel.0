Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B52D7DC3
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309381; cv=none; b=Zt42OSGX+m9nzDQnrRaa1KyeI/WkogriIKcpk3SjCVOaBDB2Eo98B92nYvSzEJLDKrBBMykvtG8bZBGjuK18jTE1CEAE2G+DfMWf7/zQ8H5e0FjWAkSbCMjJ3LEimQvSI3jN+SurqN/LE4XIQRt2sqT+b47h5i8vL7ynHz+dwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309381; c=relaxed/simple;
	bh=rz85/arNz6RsO3g0zililQ8uETwv+F0iyZRoWVQC+EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=an2b+pCBTn5QzMwy114NrKEXF5oNar58hD5nBr8T431HFJ6gQaUn7NDJHvB8DYhNh0+57Sh0UGyJ0OFwV8OSX4Dduxu+DeRoNCf6c2NArwmiODIa7HzY7hq92FtmM/Osbyb5SGOSvHZZqTnwJFrtGsU+uyCtJ0jAK5IpKLiWSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCcdx13r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCcdx13r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULmanO030546
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPfFz+jJCaCOBtaru36gwrt+7dEJBz4BRIuDpZVmIA8=; b=BCcdx13rnITI8ibx
	ZWmYphcSmweMZGvlDEINVH610zwPBu3VzVjK01VAhTl0Ov3bPR315XcEEH7e9IjQ
	nHmRXKVFyeUVIR65WC3gJ/mOhlld3Qo6x6zhPGKCiZYhUDc8CGscbnhBiuLYjYA9
	uwQXEvAgoJUSW3+QXp+WcJWFyvQjG+QyshfqvfzaAjcbII5zbaqxkd0AIr3ZwIsB
	IYw37j5gO038nJuXYQNFRvzNxUABAD6tX3KWmogw6wH/z58M+ueS2KlmYoAhdbxU
	sGGckbI3XAHV1nNvO70PYnMkGFKUZ28QzU2jeElyiLhRPr8Tt8C30ZCZ7VwORBA7
	7xW+3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdkpvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 09:02:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dc37a99897so13918961cf.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 02:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309378; x=1759914178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfFz+jJCaCOBtaru36gwrt+7dEJBz4BRIuDpZVmIA8=;
        b=wIdBaUAh8LUX6nAadzbjnxbh/wcIXzBo7PPN0kU6oUkla3ldYxlEPZTrfoOxY7r4nv
         tRK+DVnk/lIkxC14eY+p/NQGmAFMwQ2ygDVekRfS1iY2nSJW755H3aGMnm5XYzuFaHcL
         ajFDlYfA2Asw5g950YNbsHqQkoPcQ9DxECUxh68ZpTecKlLAd3hTxbi9JMWXC7Tpyl6g
         MXzV2twk5PZb5Ki+b/Tyl3PTdPs+nUyi05s5T/ges71cnWFOWpCbP/pCqL85qVlUJZGN
         f8bXn56oPW5HDfAPbh0anf5AzvVeO56rIBht4qShUCcluU7LGb9sDV8rRw4GEzMYxugh
         uKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVn8f6utLpM4wDS/WHuded3uIxjc48KcU0eQgvT+w4PNlGXf8ombJrKdY5pBRaLsLvKds9ywcwI/6dTZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygcfm6bnDA/0qq7R1zCUcW54Uz+NdShovHY9rDHqAyMaelo4Gr
	eRPt1AXs/azojCdXE+mpanSwXZPGQiZmM+o+xnC8HuLAdmSVi34gdR9Ukw/ihz5a3UhGTJtiOvM
	GV/hvk0U4u9uzMSVTaZr5CO6sJDhBKGVAo4SgeBsVdoZwkAEJyVWlAUx6h0EWV/P5Vg==
X-Gm-Gg: ASbGncu5DvFB3aupjGX4oTDP7U0+fjjNyhkTWIqKrRE4LHgNM4TFSrj9VsYI+QfB2UT
	7xh9llr+Pf29LUIJehgyPJ4fkg9RBKReyKawW6QIufjtyfvN8vGKYYxplnre+IFo6OWvKZIMtuI
	Jyfl7ufrRCXCRIQ3g5vhDFrPBVm9JQn+5Joep5YF/JLTdZwVRkkL0YRU2D2na3pFFf+Q5yINgHP
	r53IW40mqiC59KyoHn6e8oLjiPx0QEOpO8RRoj07qQwwybjjgU/0yV0uy5aRKC9UsIO/qIfZKqZ
	kjRNRuqYcGi70GpbGkUf2le5evUGJ0AJDKNNu5tiT0i/Wx86vke/vc68465/1fWcfXOheIGQvco
	ImzwST2iNwfwxJrEbq7GEjUS6WoY=
X-Received: by 2002:ac8:5a06:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e41c1605aemr23476311cf.1.1759309377546;
        Wed, 01 Oct 2025 02:02:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU9Szphg/SN7TMvpOPbN0MRBm6lNfueGopwk8fIzSbGuR1BhVcLsJaaOfRkusSv6notyn1SQ==
X-Received: by 2002:ac8:5a06:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e41c1605aemr23475831cf.1.1759309376823;
        Wed, 01 Oct 2025 02:02:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2cd7sm11618651a12.31.2025.10.01.02.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:02:56 -0700 (PDT)
Message-ID: <c0567a7c-9d21-4fd4-8140-99e72184dc2e@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:02:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
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
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2iDkNKmoq5G5uFFMnew18x9oHxy-oiKz
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dcee43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8
 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=bvKeCVLL_wdwnHjQap0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 2iDkNKmoq5G5uFFMnew18x9oHxy-oiKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX4e+iVVNYaV3e
 Ol7xRw0PWJu6mIJbJQxDlnSoLC2TqIxxPvVnurSd3GcjDkdjI7gS0hI9WtMhLS5Y5k0LhO2UcsD
 LDOYV5sT6wephEk2Yo5duSqFFTg7LT/EGtYlR7gWo0sTCYDGW/zXTNZzwFsNCyKv802AfOMnbtb
 lti3cWBLD+j09msbeThxsD46Ml9rAajU/MMWhFGBJhqZJzFCj3qGLHTbeZg8pW4MTbKe6JigiUJ
 D+qkCkF4MOQMoNX1ZC6QJJddeHT5mTCfUH0pQtxXYh05A8AjyavyzMfUjVdCO1PcnQAxVYrliDg
 6yx2cq0MypTRsFRQAKa6SAQLj0ZP9hftf0E/YX9LeDHdHn8hjJFwN/50QYafpjVOfrxEfy48HQs
 k2lTc/lpJ6FOBsSuNxKxbdp2jCZ8bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 9/29/25 7:05 AM, Paul Sajna wrote:
> Rollup of improved hardware support via devicetree for LG G7 ThinQ 
> (judyln) from sdm845-mainline kernel fork
> 
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
> 
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
> 
> Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002
> 
> Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v3:

Please run `b4 trailers -u` before resending to pick up any tags
you received in review

Konrad
