Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D01EF389
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265199; cv=none; b=OEysdl9XUIP/DwQiT6mobHq8/lJFRmNiN4m1DABHU7t/qce0PR7nmhqXDzl6H8L84ZGNH7l3a+OWKdrpaPntk6LK8EdxMt4H6Was2bOVbh+muvsifw3WMUAbdEbt5iXhjH3vf4tEvnhK73JAfa1/gJQsOC4SLuOIQkJ9FTFKGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265199; c=relaxed/simple;
	bh=OU7Gd0jDNBLAcjP/j8tR7B/qAzAvH39PrywOYUx9vXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSaVKnBC/b7Oenjyc8Bt/psJkfmjZzOg868UC6l1xDju1dV8h1BJ4YH+XzAWrr2tV+uStWMTdSBx4SOzcdykg/diDLZtzLVFap69tS1Wit/ptQEtMhBj4GX/bjawzan7+8UNzUXrb+xe6A74wlZY5ssLvyhurPvhHD+6uWlFxNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrwFg0e1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrwFg0e1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIg6B3028203
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnQHdwxDrAE/khhJ7QSLyL7t
	J4Af691zv3dtuvcnSwo=; b=OrwFg0e1cqFCn6ygDEx2y4j8wpudvfSW/yCDeLxJ
	YI+WVxdhe4QtaaaOc3Yu9n3xqsqet/K7xFGvTIqWxYviInOeMW1Jp049RRqVBhWY
	an1Ki2EI/KdZiz53ND8PQ4YnZ30NVo+HSL75VXNXdcL9Me0xM2Sf94lAeqzOuqQF
	wzD2FMmoDm5LaOTfFlrzpcGkxmudwogPsn0Uux51IlJTJa1Xsc7Co5MAq6K4Utgn
	4/DbtW7wVXApHUDXUwyr2Y2G+XemI32kAb6L5/ILukiyzLd5VuweyN5BFHdSoFnZ
	FIggkyD2kwr160n8+5zNNcM/5oWWHskr+YIQk6A8z8YWbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478w6f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d9d8890fso953312085a.1
        for <phone-devel@vger.kernel.org>; Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265196; x=1745869996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnQHdwxDrAE/khhJ7QSLyL7tJ4Af691zv3dtuvcnSwo=;
        b=h2rT2X/Q1L+H9kNWeql8bRgS5MhsK4BsBWnJZlxBeD9GgWsqeGrxBArclozvFoyfV9
         w1l2dN6rYi15IXxvhhPJdChENgSzIUUOalc1DE6cOMfukFurPy7JK3yBFCp3QpbjJIXi
         AR1WtKBKKyS6pzKJyYRwIOrkP3soDQ39SWjzZMi0YNk08BBzaCzmidVvv1HD+RjRdXNn
         MjPcyebU4smuZcPKhyxBEcxW+jVeqZB5QYTqkwRCq/mdXUwQdFKfVq2DWaqlS2QgHJdl
         UV4vDid5yk0VzRvzlJAiFOLL/7PFu8a9iY1Aag8wKgVWqZFdwZUDnb3yG1Aj2LprMOwD
         hFzw==
X-Forwarded-Encrypted: i=1; AJvYcCVPJRFV8MKd4Yb68aFQkmoDKC7nPjejPQBPU5RIgGAdehj++jZYd/Rli9Fg2s0jVSnHpm8ibfuyGNIIcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKxW8LPExfieg1JYgFtluUW1e1uu53NDhajIl2jUNYDhem9gO
	wlnwIB4th79wE58cAw8zSW0X8KvgRACMSy0TRSnb0T/wd3dRCZh+mdq+ytb1QwPjZaUrhNxAk3W
	EG/KnXJ8Z1bLIzQRQDTdSbQ84dxzFs2YgCiJJsRgWjumI+aI7EGZB7j/GJd8Aww==
X-Gm-Gg: ASbGncvQNSPinAHh+DY1DzOutYpXK6XJ4QH84g2wNnLZk6j82msr6yE08xzSzPl/ht7
	DXNgGt1ZTn5dy6VzZyx9dROrKeNDs5JmcNYsDPfhQsoNRVn/g2lnc9XHB2uPvobHNG1IA1hpBLj
	GVrDkWU7wkwt9JL0X57ci8baV5s8HzbH7htT/8LLa0B0kFqz8V4ea3jGqBA6fVzsy21G9mdwbmQ
	zYChvgAIWPUixjBO4c1yMBfBUv31yXT5wcZJ6WOEgG8EjJt73Xt+n+ziNdO7JVXtCFjReKa5x9P
	soazekWkJ4CQYxP010CD8B51GA2Ckfl9ulMfV1jWKvKW7GnQBULwy+Py+lDKVRc4lsKuXy0t988
	=
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361734385a.17.1745265196288;
        Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKwkTFJPLVGZroJhqvUxxew3udNXbpWiYRQo2p8soWzPbcuaepKjeZEAoQXu3ztfdDN2Bog==
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361731185a.17.1745265195965;
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540eccsm1024666e87.74.2025.04.21.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:53:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: qcom: sony-xperia-rhine: Move camera
 buttons to amami & honami
Message-ID: <7wbrnry5xzl7mno3sqtd4gpgf2riihzubkdzpu4xp47hlzmg53@ezksk4qofosi>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
X-Proofpoint-GUID: HGdRCTunXYqzD5OZ1s82B-X3vNR3B7wF
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=6806a22c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=-UYqrYhTHp0prKDFsBoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: HGdRCTunXYqzD5OZ1s82B-X3vNR3B7wF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210154

On Sat, Apr 19, 2025 at 11:00:39AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> An upcoming board in the sony-xperia-rhine family (sony-togari) does not
> have dedicated camera buttons, so move those from common rhine dtsi to
> amami and honami dts files.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
>  .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 14 --------------
>  3 files changed, 32 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
