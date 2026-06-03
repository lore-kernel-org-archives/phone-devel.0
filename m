Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C204DC52A
	for <phone-devel@vger.kernel.org>; Wed,  3 Jun 2026 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527965; cv=none; b=SAVBuY1KzwHv9FyYGEkb4+Qht2QilsD7V3ROghZtWi82tHb5MTxvU05GIVkq/s+m+f2jV8xoXyWecZQxviogNJ7ARDXf0MrYBAonKTg8o5AWaZTqJP6vgU3LEWzsuhEu1j9XLHOMfXvZ+LlUJ4o90+otXxM9oia6Q+aFu7XZ+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527965; c=relaxed/simple;
	bh=DvqM6O+dyYTLZ01exqPhdqzx/bR/VnVcf6GbdXraF2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtOxYSgTT7g1SZDiYoKZBLU8PgwnvFASPH4qQyHTyq+g0ILrMNikM1rK4LEvyw7AQri/QbPxvZtBNrdVJ38iK8l2CoUp5j9aDjvWcgCpE+OTj9MdAj1NKSk4JEm2dbrd0oxpDUJQMZbPl+aQqtrQFzd6VZzzWmJX+fDEjW93SRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CyaQWLGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4aFDSn1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CyaQWLGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4aFDSn1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653KAStt1946638
	for <phone-devel@vger.kernel.org>; Wed, 3 Jun 2026 23:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=82ey+qtJsmPiYTMGfZ7xO3mJ
	zQh9v2P9f6+Hi1Den34=; b=CyaQWLGneLz8ABhqGM2q1pm5pPR0xVvspzioIiPY
	9JiO4kj1yR//gc9dsRZ49rychKicTdjrbCYdy0nfEJWEEo0rMlqfGfHYHoTmLJVF
	nKFUlY3dxyguXZVYwxKGTpryfmqaEXFoAg6lehvguV75ncruZRgfCS4RR9rC6Wza
	1XP/ChzNjImi72U7A7cWxSmgiLKwgrhPlbwk2wAbE2v7ZqS3CLDQD1U6JJn4x/K+
	u67Nf+R0jELRGKC52nTsdLQBLjI2hhziBIDrKhSJAUVAr4bfYe28Oda3wJfL1QC8
	SYGCS3Sf0cZH11Tiw0duHvxE4u9GMYXfzr914Rd0KyJ1qg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgmxyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 23:06:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b2863d62so55521241.0
        for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527963; x=1781132763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82ey+qtJsmPiYTMGfZ7xO3mJzQh9v2P9f6+Hi1Den34=;
        b=P4aFDSn1Ys7DHhzSaCO/a77273iw/DOVA7xRlov8EG8iVT8nU2EHgbsHXnr3uSs7h8
         mjfc/pquBCEVZCjFdOTH4WkJftxvqATjBoCU936bL0zieOpWqWOTcvmZ47chHlOP1bWN
         JlU2pVtaU6TxXUupFDMykBFAkVos+89BYuhmnzN+Sg4GjTraJfSQxcU4GHA7MY+M77N1
         LrBVm3DA6k2svm4KC3in2sF3STZvJeHnaThLDkJfngGYSRK1akWbAGRCgh7umXRQy+hF
         a9UzZKHfTOzqU4VxysK5kYw8K8SRVL7ePbrs4Mng2FRT9c9+L2Jz7/hjC/+JK82seEyn
         1luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527963; x=1781132763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82ey+qtJsmPiYTMGfZ7xO3mJzQh9v2P9f6+Hi1Den34=;
        b=KoCx+e4pWBQXATNWtuIHZ4KTFcmcdJX101Acr1lZQGwGDGlPgIOoS6qoE5NzK4J8nM
         Ld7KVWfSrLXvDkqeBeaCB55Vib7MkE19ia4GoaqN5KCHihW1NB2xdSIjY3RzJBX6orqw
         ri4wjrPGPxVRVnQLSgg0kK/sUeWtZz8UB9mo+sXQdrta3J3bzFE/nIbjAYMVR92VLV/I
         zDzGkKMOCb/o4bTCwoIq6yIA1cMtx5D9MSqHidtJEn94QYtd+pxLiQS6GJaI88K9L+U6
         IAI6hcPRZCut2XHwpHXu0Ih2wVVBa6l1sQvbn7I7iaLiv7sgA+kyA154DBJGqphmVjK5
         2+zg==
X-Forwarded-Encrypted: i=1; AFNElJ+aidrWi+LJgWLW8Kpu0AOl7rn1Op9lUqlClQeEp1+PJ/Mx+LdJBmjNMbSJ36+QbGUBV/R0Ceo9LZ/QhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysO+LngV600KqM7cl46f9xmb4RziQ5QwBh9UP2Zz/jAcKodgkG
	bwmMLPVjEAV3fzfzxaIGgDuvlZNpkR1cKcbrbKrrx/qA/Ped2OXr/81QbT5Xbf3DNv5AY7KgtgE
	QJmE0lMW2iIMAEGmCmgwMe/DosVQokk45pv4Rh444js35Ck6ptWsWygVmXfV7wyo3BA==
X-Gm-Gg: Acq92OHGdkVrSx4i8Kbmr96cjkfG1zf14ZbwRifHzPA5oh59v2cRCKLavmujlQDnTfH
	A0Z/6RSXjH7PZMSP62p3UJhn+FJ04BoLuwc2q3luIGTkH5vh/1g2L5tDPkESCCDELSH+m3mib2p
	ZlK3O4m7o8PY9hDGT2NKKG9KIbO2UUP/r3bLRtDs3Lqj8syxxc8htb7b2WeprHX2PCCRAoapUje
	+I0eD3lxIy6qosj7JfwN8RJ4asBMUDufR3OHnHfwzxfUZLEGfSQ2ruZYPu1x91ZbO7UYEUUZ6sH
	rtlAB/v9p8GPGpZPPEcS7BAWbn+QHiGWbrCAfnVPv50NQDHvXnI1CAFoNHisz1m1ZJV3srsG81R
	keS1Txk+q0USOciWCk6PCIJ9BbJDBTzn3aDPQ+FwOUXvlE4Gqk9rBLrEfg+1YVJX/TSIBObCngl
	LVZQ3yA5rdjg6O/GnewYzeCn5kgwfWGM8XhiRsbPR6e141Kg==
X-Received: by 2002:a05:6102:4421:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6ec15aa0d76mr3238960137.0.1780527962964;
        Wed, 03 Jun 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4421:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6ec15aa0d76mr3238943137.0.1780527962506;
        Wed, 03 Jun 2026 16:06:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07b66asm12801841fa.11.2026.06.03.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:06:00 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Message-ID: <zawxi6n4dfpjltpz73ciipkhui2qpo7xop3pctufazukpbea6a@5zxauixsyunj>
References: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
 <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-yukon-eagle-v2-2-f86b440583f5@gmail.com>
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a20b35c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=K3YF90I9_K2rrUiFlBAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: g85Tfpo64odpbxBhLjporHJEwKreDiTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNSBTYWx0ZWRfX9PZbZGDY/wHu
 msQSOLUl3q4ZmL1uYhgQe0+MSOxunrVhHzqesPK1E8s4ATXV5O673pqbEunX124WSG2Em2xiZ8I
 p9LnnQbxX+LgccTmomwkj381Zw2BxKX7jCd3YMNRxpRZAbwaHNtRbc2kKxDUJhEoRj00/4PNWCZ
 sRZtOAlFKyYtzBW5xQ91un4QjumarjWP/XrL+vNtGzrR5aRd30aoAbVH1PwwL7f0M+0dnczjrHb
 8HpRNfDW9WXJyCzkK0obIb82TKwiF5aUnnS3SMdH5PdcJGtxbpiAcVfe32hTwSZvhaFwr60Hi6U
 N2L9HykSxWq/+IPBjS7L88NKC44R0Q2ITq2MdUktrulb9TEqdC3yuxCMWQasS8GceBry475Gd0R
 1j8Xxqpo+BB1QaUqYzKUefsIU6uRGABBtFfqpgHe4T64yIBXx64nM5ZvHWLCDhnNsh7qBjqmpvD
 IG+nss+zKH95fcOVngg==
X-Proofpoint-ORIG-GUID: g85Tfpo64odpbxBhLjporHJEwKreDiTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030225

On Wed, Jun 03, 2026 at 06:48:22PM +0300, Erikas Bitovtas wrote:
> Add device tree for Sony Xperia M2 (sony-eagle) smartphone
> based on the Qualcomm MSM8926 SoC.
> 
> Initial features:
> - Framebuffer
> - GPIO buttons (Volume Down and Camera)
> - Regulators
> - Internal storage
> - SD card
> - Accelerometer
> - Magnetometer
> - Ambient Light/Proximity sensor
> - NFC
> - pm8226_resin (Volume Up)
> - USB/Charger
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
>  2 files changed, 404 insertions(+)
> 
> +/ {
> +	model = "Sony Xperia M2";
> +	compatible = "sony,eagle", "qcom,msm8926", "qcom,msm8226";
> +	chassis = "handset";

chassis-type

WIth that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +


-- 
With best wishes
Dmitry
