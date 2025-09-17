Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF0333A82
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116759; cv=none; b=adTGYYhyxDc7IvJFAfFL95UjM7LH9Jzsr5MhdNHqzBZ64kZXmr6LFx097goEkiC+lS5QZQ4hz11pSC7XNno97IvuLZB+4+O5I1C8Jup/KAqBO3SOtt4GXBMjRj22wGUhB8iD9jnIzXB4Z/cDU6fXeDmFUrE0XwDQJwbbn8Ce6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116759; c=relaxed/simple;
	bh=zE4COWFd4PeLhXg5vg78aNdA5WS5JeobBL9xaDYIXUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rulc13N8SFfcSQx80SgAV+V7xp1yoHJzhgr3t1+8A5K2qiRCR5vdphXlsDQEHOpQQhn//AZA4W9UkIxBTVXAJyyyKGig53OCangPg9oQ16znCY1VeqLbwKfgV72pdH4GjbgwvNCxzHUAUGPl8hXychj9qdnkfSaIEsuJ8qFL0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgU2OpVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgU2OpVS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDGKs0003563
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P21xIuI10yUBLOVyIRJ8t+l+eOXwhbc5+qIAnLXXNLs=; b=bgU2OpVSyUJBD3BD
	4WPnB7ge2kafJZ1YpPLLevKHcU77nisprbJ3nLf3kIbrdoDjl1lSwu+zai9+96Te
	O2tsOL6ZR9y2ehX0Z2FA0nWfE0pSUiZuYife/2K4P6+5j47IjSibeu8lIhS9h3P5
	pTfT8b2K5VLQpFtVqnjEoErPd7wIoAhjwnc7+uXmYfQOa/e+hIqqy6Ui/3GXH0yM
	ThIMF5Gq4D+8KwoALFqVcyq9fCrFzoomn41T/IXmReSY7HXsLftMF4Hs9Lu4ujZ7
	BrYm0ohce8dxWHF6zhA6jspOuqD2UI3hyQGpvzXdrskD8tHZeRoZnc1CfvQYcVpi
	EKo1tQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgr2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:45:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b7a8229679so3746611cf.0
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116756; x=1758721556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P21xIuI10yUBLOVyIRJ8t+l+eOXwhbc5+qIAnLXXNLs=;
        b=IV5Qjew+23DNbBcMZEuqRTv2rF4aKH3gUuhcRHQGq1mxZpi8UA5WlkJZN8EQG/c0lF
         iRGLTga5zDDslAU/pSiuTLn7MjM5CAim4Hcu4+A1Urb/P2FHz8lccXLa5N+i2yvLSNWI
         WM0XS9QqG78jodJKo4NIiQtiBIG3FfJGC86TrrZbs5nYnZybMUANkhQouKD/KycaTTJu
         lds5bdqfxvSYw5gIIycY8KN7Q6U8N76qBKBQwYO1TlwvpzKep8ZX5LL6ijkrxPHZo8ZW
         +7ZXtBerLAdaQqlcDWGcjbDreSHolfgFWGlXFwoOLbln1HsNIQvtMkJuh6yCkpoYjAkG
         Hmbg==
X-Forwarded-Encrypted: i=1; AJvYcCVIoQRqBwxdP2ICIAyQbpjSTaGseOkoee0IyjryzncKJmRTYtESO5Onhb/8ShVnRflf/UqtvBL4ou/CMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3N0yUPtb5DFKiM4oZUxRG+8H3zAJfPLtOLJy8yn96XN5093a3
	h5yPclqWuJya3POLRHh5fBSGZhmJaaruyO4wp6ZFgvdGEfKIKp3NAg3n5NhfSeZfOFVtLF7mQmO
	o5IaDwXAEJyecr2nLCBz3SykOhZWFswaWyWX+BYjGnPKo5MxiYaLpb4Ny6FmSn0Imyw==
X-Gm-Gg: ASbGnctKYjff+u7BqlGp8Apz99pk43FXj6vzD4ISWXT+l7KPGh8IUv4GlFq1RBN3K3j
	K4PmK7PyWVbDEpT4jBu99rg/qqktHTAwZgVUPDJhgIBVFpFu5X1DlHH31ycJFeDKKjWKtLkAX9H
	pbx1sAjwH1SJ8zim0ANQeQFgVqICA7pX/jGlnxKbLJ2+sRdmQ2F8ap3vrzzeENIC2PILg6igHTb
	0LpUwnjRe2lteBE4JT0yBobcieEHG6yLJHGUoxujGRNRd6OpSUoXT6phu9wUvKiqE70SGjmmbiG
	m8lqrqe1zaFEhrc4GDsKnTHaf7dYgfkFk/ZID9w1bBMaxg8bD2MSqv8WWFrP3+Vi60dGkgQj3Rj
	wsQ/w5zREri8WeL/weh9l0Q==
X-Received: by 2002:ac8:5dc7:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4ba66a30247mr17249701cf.4.1758116755765;
        Wed, 17 Sep 2025 06:45:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErNYH+JoLm17xNJUN8Ky2dbJ8QLxCLgtdEnNFK7p2G/gtB9/n2aKNVZmhfC+5+y8ZgpWMY5A==
X-Received: by 2002:ac8:5dc7:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4ba66a30247mr17249441cf.4.1758116755132;
        Wed, 17 Sep 2025 06:45:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0cf2112639sm779028866b.104.2025.09.17.06.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:45:54 -0700 (PDT)
Message-ID: <9d64f6cc-22b3-41ee-ab1e-d6e571562b5d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:45:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] arm64: dts: qcom: sdm845-lg-common: Add camera
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
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-10-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-10-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5EcbOXxPDVhZQ4yXg-XpSJucpC3ktokk
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cabb94 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=gtE8S8QUnRp0gXVXfVUA:9 a=QEXdDO2ut3YA:10 a=IQdlk4_VRkkA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 5EcbOXxPDVhZQ4yXg-XpSJucpC3ktokk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX+792XD/ZDH3Y
 LmbFPs6N680IabLeMRv2CU+YiZfDxplaNzWnrDvxbANd7JFyuf2pWRrBkSYFEKAfpp4+/FmJKhv
 i22lcPvEbP9gMPrtRalOL/8nGl1v8bkD44O9H5lOhtNW/OQ1pS16t+60grd7zQAVGiAXQNhF0BV
 MFzy8IC6ZcKD1qQHkmQXYPzzmU/sERC32BTtD1IGI8A/s2S8divgZShktSN/U8oVAXVOLEJX57V
 kNnZi4EASVZhVkyL8VrW8lLJ21y14f5Zctu5wc7Fv4+ISEwyBvtNGjyt2f6K7nqxBwKynz30Pce
 hwVvYPaSgTQT6P7dHyEG/aNSkNqiOS6q2+jdMe9hjHBjMsaJbXZ6MXF9Dd+hGtUuqWG8e8M0D2D
 EYVkowo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

On 9/17/25 3:09 AM, Paul Sajna wrote:
> So it can be used as a flashlight
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
