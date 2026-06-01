Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D83546D9
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315667; cv=none; b=uCp0TV5bGpycqiT6h/QGyCbZYZqXIDjmfSlNv1kDk3aCVIwHNxTICGv6ZSMWjnDKF80v+bGgMorPet0jktnQvKoq1Bscj9W2Wuss4rWHZUzYoYbSmJJaXXWLEQ/xFC92p2t0gZHaEgffgWsA4dlsfvXMZCIAzlpymYI0sChuG0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315667; c=relaxed/simple;
	bh=zs0qdbXs2x30afTWW7YL6ZC9DLX82eZT/SOhbldZUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgSSQ4HsoW1CdR3ukxmXpG+isxYWyx/7xYXCFRsro84538/OinSV2uI4Jvs/qfKB/SBo579fLKsLkP6aT6EHRcH5Uz9NUO5yBVqstySF7u+iQZX/800vcqlfyzOvFydWNcL4XCcVvYGhe4k1UI5Xp2/JcpPKLlQlhjH0ctrBRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOkbTG24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj1Vnceg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOkbTG24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj1Vnceg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517N1Te2882669
	for <phone-devel@vger.kernel.org>; Mon, 1 Jun 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dv11lKJOxLoelkQcyG8M51LX
	H0JVFSvQtsQEal0SIx0=; b=YOkbTG24moufP5CdBcqmMwE9sLCpQl45J7dEwBT8
	f+iuJCMLrmkN3vziDKDfcPRPTGeeJqfmP4N67LZIJik6PvBnTPK6b5JjrhMpOPy8
	qaT0kZ65/fkIpMUjSKkwvhpTTW05D37684pzg40tU24lK5tLCcKtF2vKtIULHQ9P
	7hwSeO2F/0XOyb80YXw2B7gODzRsq6+7nfxlDy9KpYVin+bhDBl9RqtQN6cWlG/9
	aXTlxrp+e0Bdby+gBscZ//Q33Yddd70HtNXNbNZib7Ct+pDNa0KRFolOJJGFEZu0
	laK7XZUa9o2wg2Ljsc4dfe5oi3gBuln1DW7jCU4TLNQt5A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ffjbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 12:07:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ebb69acadso737116e0c.1
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315664; x=1780920464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=gj1VncegwH0cESmBjQXP5s5apMyQ1mDGGfhByd7lQ+xO9XIp9WRgL4pKKaqlvBeART
         vyoAqeFFsYSRHkarEcQjwuFFkMIw4VP4U5CIgjaGuak2r3dOdKt2NHyl59+u2r4o6NhM
         I8goOHs4MqaXqZs1NXTzaepD4eysAefZWHJl2b8uv6zBXXtmyYXh7ilKAhTCjfymTYNV
         1oGJnNY9DoJUbw3cZ6+Hp26ouzwgBNjAyM3y/nqL3CMemI0eFAmQB3ACV15ebxoDe2hk
         iXtsYp1qtJH0ywNYtcaZLwoC82hDXF68ByzRLzbz3jN5wQ1GxpqMkAoGe/RDaeg/WSWC
         4Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315664; x=1780920464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv11lKJOxLoelkQcyG8M51LXH0JVFSvQtsQEal0SIx0=;
        b=kTmCrC3VUVu6bAfa8li17Kg8j5BHG38GEjTMO+IixgEAW76Z4MzqUQDWsHwf/w33gi
         Dk1AGZ8mLHGukPlzcZv1OmMZ/BiQQmQRmKFhkLafZefFFwuAH9E1DNgHOd2DTQ6qmk47
         ivckcAW2zull12SHLYKh+/YW51g4nagY4okDsT4WgWPttPgc/9VhCpkOgkwgfi/zU3hM
         WfVgO9fMn9iBRVwd/XjwniHMuc8Tbxr6g+LR4xKlawZ2bcS0gjslLTWY35QV9zBBtDhY
         DmsmNqhpF5hHhF2tx4f7Rg6KLDCrLkv9FUZFPKwBi7DXJAS8xN64IhqDdjs57qWYOXxf
         edrg==
X-Forwarded-Encrypted: i=1; AFNElJ+jN9vGMd4SFcPo/ryDmFpSIZIb7mLNFhKiinmO4JuTClKXXwpssJS4akLbuC6eKHnzt2VPE0UXB44+yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4AM/qf0XfHJjl/8ceuE0glHT7Gc8G7Eb1MoCDjpDW4dChwYH
	1ApfD/BB27CGJ1qBp5FFECprSyq877fvPF7IdrpVz10zb900qaCVF72RR2GDzFDIeqVp7MTpU0q
	BSkwRmJC+sniB37wqSlm32rvXiFwWkg/b2fxuovuAF3BH1ot47JjUqrOL4Sxuomlc1Q==
X-Gm-Gg: Acq92OGxJDJFbBqK9Zbbrpk08poUVwPPNu3mDu8iwDp9rSRnQgzi3kb0yFwnHHnFZsX
	+7JoGUiF93q0OKUwgKSqiRSq4tE189yFCNr7rG7DdTYGtOaXRN70K8EWvc91IAW584S9etcOkou
	Z6/4s6f/wduasUskEnG+fLE2FsrBAZT51pZ0PITZAiA+eomjhwmOVteo5stsAI0tDh5r6xjVsRL
	Bsg4j7vCHvqZME53BzFPkd4AxZ0mPN+cDGxMhevgFy6kQkfDPVR5couEHEU2gRHX02ZjFpAo/Yy
	YB2ySY8XO5kUYV9nGJS24v7qnVCAxwfdhWB3NUp4gNDpCOEZFTdp5nLqefv3M90SLmvQVa5icMe
	XIFXve34cRgLz78nP0DeUCLc1JVdYlG4RL81Nd6OgAVMzL9YaDGfy7Wy6HLnYfCYQdpQv3EMW0k
	oU2cIWNgjtb3eUmK2/exNdZ+g0chGkhWYFB8WJvBgja+HLlw==
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683145e0c.10.1780315663918;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
X-Received: by 2002:a05:6122:178b:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5a25c658b47mr683042e0c.10.1780315663363;
        Mon, 01 Jun 2026 05:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm1516467e87.4.2026.06.01.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:07:42 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:07:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Message-ID: <vsbimklkzmee63nfwpnx2b7dtlilfcaqwv6d3gj4xkmm6x7hpd@rdc75raf7q4b>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-10-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: blAhuzvisFwTexJU5jMhBT6is8n6VC0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfX/NTc+GnHXHP3
 0v7uwEwIoW3LNZ1uP85i7B4L1wtFAxHa7D4R1jUiaNbg40fODi0oG2PSbH57E60Wz7jX+1iZj+q
 0Kw6HpQ8t3RXqBfJbB/2Ul/AvjenC0KE4uEedjpg7XQLvExj2kHF5w14B/NOSL3MjVktl49z5k1
 IN23A/4iv6Y9ArNA8gG1LG5oovCc9hAG5BN45eIQ7i3PE0CHvHYQqzr6geXU/A3NgI5JUxBHHdz
 p9OCGHkUjRoCKa8ER0rOmpNfxXvzNSe5LprxXLB6DJdfKKMDApodaF7NoSCjJmDlce8MB24L7AP
 OwIB5n292ite2tn3zjFmttoagBLFGbiGRtrz/u8Iqn/mgfJZR0ZcHESKtJE5F/tpMMDpSrBufKF
 MUdoi5Bix2fuA661T7ThRTfuaB2j53CE2jz4B5pdOjJ9X5luY9mH+2mj3p67nLhv7mjdL0VqKwX
 py4kwuvHKj9TV5iObEQ==
X-Proofpoint-GUID: blAhuzvisFwTexJU5jMhBT6is8n6VC0s
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d7610 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Li_iKjNru-aZ8oNNNaIA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010121

On Mon, Jun 01, 2026 at 03:51:23PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
