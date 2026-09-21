Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4C493D25
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992066; cv=none; b=dKLfyf/kRaJIppDDEW8dH66QBIBatJHditCGZYngHPeYV0wgDGosxTvZHytQ4+0Bi+ParWG599fEFPmwzyazkUvf3K06/niWdYhtUKx0L/e5FmMrZeEP+knFT64ZKExmRtyuwddVxO2nO/vvdaD+2IwJa9fgw76XIyxTQ6i/8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992066; c=relaxed/simple;
	bh=xJYmpMkdOypN7Sj/n2yeRBJRaKDrZu1gaBC/xhMqLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SX5ZwpIBu1K85gpj9sSAtZ/bLSXTXWdz3SJmnJqpjUWbFlSHka20am3mKPK2KB6y2gZzFP3z2LfUmGOiHNbS2Cp50ZhhZitM/u3TdrvEepknbkfv42TTXUdh5EcjTkej3ySpKIRIogjZxKC72dw1+Bh4Z9qX6kigX+B2jWv4gRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm8eWGDr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENLTbdcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm8eWGDr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENLTbdcG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4i5a1129525
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WexGBER5d9uASCyOQRs0xONS
	Wi6CvrW7lSCk7SoMFoM=; b=Mm8eWGDrXAz/5Yap6kZWHCr5gxSUsrfrn5x9THLd
	UzuW5g1/WwNetvQ1yQzJJVrR7mPFt603Vmoo+KcNMqq1YimWb/7CEjDhvYSBIFO1
	FmKg6duF8mCLcCpmmsXb3xH+VPzwGqdMKJRe7YJ3PpGJUP0KoRLu2vVOea4qpPJh
	ZIGI6Ml75kN2dwemHjZscrRJ5FitfkmXtbtJ61Th0MW7MS8e6bGdlYi0lit4uVVA
	6nVLtzQtgqCUoWNt2wGlTmCiufffMM07ACKhCz/1RG5e3iDlZXNtuM45M6vSgfHg
	RbEi47seoqH0Ub41gyQm6qi6s75ORAFg9pJQlgi3i5tG5Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg6uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so649888e0c.3
        for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992063; x=1790596863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=ENLTbdcGhonsAyKvL8pKbVV/S3M2bAtjCj8ysg1x7VO/Cagz5Kj6E/Px6W/PecB56z
         Wg5juPQFV4C0U03jArTP08jEsx2IxF/F5ppXR0rF8YTmqitPrz1Jr2SMrWDupMm7sp4b
         OMO/rgs5FzzFezivZSp5an11F77A/p3EldLMcejNk47dMZUCorrqdjYz7LP4HKisL4wQ
         Sy+P6yvRe9eAqYPsVEv1pGGN8q3pyNjQwYF/okk7duxW1UW38tYqxsfMbkmvMWGcwh3P
         j4NdZ6OyiRW1AcMWfuqIsZsCyHfATYc027Mc6MdLScFHD3AdsLaMp6C63730EJ1FA038
         8hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992063; x=1790596863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=itW3WskxYMFO5v1Tnb7BmmMmMNkgX1UPXia4UrLYj4B2Q0BTOffa17nfTvFxXaG5Uv
         pv987DinToyYzbM68NjgPNV6+fp3TuvettM9aZFAC6ikFUFy6P5r41yUKQBcnc+RLNMO
         qVKQTVGxeT2RZJjILIko0XXbqi6wZYfjj7RxH83xrYdyIJfZMRbQ5MI9AZH5qiSw7z/v
         FdtOSLUnwNBRe2flRz5lWSPOqosej3GDTylyw1CyLhBvvmqu0sUwzxW6Ooh7M+d5mKni
         BE5CEMhxZ43DCNSu56P9PGXX2/rMP0Aotjbx81K8rAXTlQGjQiatOSv2L4KgRFT25MkQ
         eZzw==
X-Forwarded-Encrypted: i=1; AKwUvBxyjPv1ACzg5udEBvOCYSjuUFCDhU1E/aIpwmy9y0+39kedjNfoz6CGeVN/NgKFXkmv/WxEq+IaDHyREw==@vger.kernel.org
X-Gm-Message-State: AFuF++l63z/qzMx3qK1SkNoNDpd06KEKpyYixH3CkqPuZHu7MYhV59ED
	UQrCyaq0rBE5VYlmG+Y6d0xfXszChQG2pxdpZqurDSXTNNwzlQxnnvRw0b9yST0/G4vFwDRLwO5
	4rsJJHuM62LqkdTVy+knQkiSuX8beWgC0TJZeG3u6900Ovw9FnSFCzgL5ksgra2MT1w==
X-Gm-Gg: AYBFou2ATd1GjZZT9UW2PGsMbXGzAlatg6UkNH51vzqgxZSnY4Kt8xLIn/Ow45vbeMJ
	XOTjnT1EGeDVfq8c455QgY4voZbGvwmCpg+NTFjyGtET1MwRbsAZEqvHgO3KChtkq4gnrcuU20f
	2OguPnka40fsH4YWjsWaQrtfNUCdTrOXNYIGmHyEI4TUyI3MQ7wmrz6qU9IAmvPEKttFGZiO8ln
	7b31rxbanJO92WcwecLKSzLwCDWQ3BjkqzxEPkIWSRpfNl8QGhvJk8bnjZUzJnHaiZSj9ZleJje
	tjXO33kMbJBsIxtx+IBqwZutzAu9MhI1C7LfWjMRdW40mufhk+Z+ekA9w5pH38hGp5+YrxS5mlQ
	2dnEerFJtBfPux9c=
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760495137.26.1789992063331;
        Mon, 21 Sep 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760444137.26.1789992062795;
        Mon, 21 Sep 2026 05:01:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm294306075e9.3.2026.09.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:01:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Message-ID: <dqlby3gbrub5x6rdwd655wu437xonhlxhvrhxaojupi4wzvbff@3vgdyj7sxmw2>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
 <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXxSbCWVhF+dr7
 uUkpwQQzAdbjfTdJXD0kW1dWruNeDtRBg6x67mDQl+94YVOMmp7VHsCZLwW+Pj3+tJoOvW4HBdx
 iXIQv3ppMr+s6zyAVfCiqmZht8CWL4c=
X-Proofpoint-GUID: 8AR0WWu8OHcOMDQxwFSElny_mKPbmTtv
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11c80 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HVTXq6jCC7j2OmNmFLcA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXxnZjKTZ5vux6
 t/YQxuI8MqmhiYim/Pa57QIghfdp3kQu00z3GESDeS2qc3wbS09nZCdfzB/O1QrY7cX9JLDoJGW
 /mSnIQ+VOFO4a8guOxpdOEdMguYwY3RGelZSaox18Vbh2rDy9NsHdU/nVxdXZ21Uj38OdoM+I0h
 cZWUK4DNqr135uo90ptaq7KDk/rd+55euwLwv32vO2ip3CN0s8q8uNZDKarncKilTegrTZqL3wu
 6kmswMsCmT6tbhk7eRNBrz/OTZkuuyRw1cVabh1SS6cdgcZ9+nlgZE/ZirlVmmvOknkooGCW1YM
 jD/7b7SQI1lG3i8WXvDzXpAmtpy1kXWVCabJi+YuVnQR/CwliZ2zVIVobUKs2DA1sPTfCkeO4PC
 r0NQntntosWgxz1ISdIHP5yKdBnaq24It8IlUiaAndfN3DchkLZLL7gcM+PhrIAXVqaTZgUwWAy
 QbyzxQ2mXKZcITMmFbw==
X-Proofpoint-ORIG-GUID: 8AR0WWu8OHcOMDQxwFSElny_mKPbmTtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 26-09-18 09:29:54, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
