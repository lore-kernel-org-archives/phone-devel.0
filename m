Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228395;
	b=f49aZrIb7N4QS/aitgfWSsZWKCdHuhYer4CThs/yMM9cwfJcJezlrepeVLGo5eQH4hMP
	 V91VV6/svvxxJmFj5lxnStBhKfkCzmj0+/g21GgcWXFeDmZGC/Mvv5LtAG09CMA0nJfoF
	 DCamAHrxHnp+QkuL6DaMa43P2Hgq8gWSmbN7uRFhsUuR8/1Sj4eLlObPkJnwItlpbrsjA
	 gL3hQBPWF4EMgu7NdmIJpK9e/mjDm4z29gdIb/6Pk77sVdbcdN8wmm+mxuJpEFKqSR089
	 hQt93PyUVmoDeG65YGzLx9EpaT8G8HfczMs2QbNpRJhl9wML7h4w+Wi6SymVQEsGIrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
	b=j9Bao2JoqWnKvXb1P17WBbKMvWb8UdH6pk/AB1tFq4gZchXNiHgA91mp/g5SiD/SYTCm
	 x1rprbauwxl/SDf2Je8LG6QVPE8BRhWxZsHtdciSueDpyCLhmKyFt8sbjzv23xMVZ/Ocw
	 /VgDlXkwViLekFkSERkG3oPrugRUFkM+rScYHh0k5vwxDUYvtaTuOX4fL2BBNdUDHlezF
	 Ysc2f8/hy4hLm4xzE8k0nmUVe7gVHGPAyL6/J7NyfUSo54zTfxhf3Ls9kGsqJTbN1WrY6
	 4OhwzpTl99U+hk5o75S6t23bIzPeTBMD0fUqSp1g9y/IxygrRK9Es6mVaSqtzht7N4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF457606A338
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 12:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF457606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Bb0vq126423
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 12:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2DrjEQhS2plkSy9Rd6l6RNy
	JAVrhDy3SRTeWurwWbA=; b=RomvDkRx5seqh3RBtVKxeSElUiTNUWGZRFrSS3EK
	YoOV3nhMHX6VByKAcP3tIYHQanrVkWHqOd6VvTuZIC9ypoApv5IuoZaYDOrOiM5a
	MVcF4O8d26Jx5um7DR5RzHKpdkbZzm8vSB/ocSUajzALuUxmKTtTTxbivPKwFBb/
	R/W5R1YAOMNNbENJuWBmNCums9L4H3IwLTJr7f2VMfWaUv4rHMCIQhTWcbLKgYhS
	FOQ6GJDPv7ZWj7Kv+Cb9JA5hbo6wdwS5aehNeQE2VBg7SVqDDFtoi+Lm23/ojvgG
	Kz+rzV6gMGdDr35CaFXafAPShlWb/I+0oGT9uLoUmVsh5Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf587g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 12:46:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2f2df81bbso382906137.3
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 04:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228393; x=1794833193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=jyCacWf6sPhjmyJzdPBLDaxJZ/q2Ae4rKzLj4KSmyzJKNP9H5ASsmF3VcFONHFb5bx
         EkSBc+4tJ+8zjqCIe8aNeNWRTtVU3yuC0CFOb0kVnmRwbEVtZ7iOTY3Jec2VzLlcAm+H
         UxmkQPqoeMWB5/WhDTWWSECqoe/MzXZp1LdTab+ceaVcnTsMlWSstIpg/ZjK/WPbiLn0
         uag51yU5WKaF7K4pADG7fFOo7i7BeNbiN1J6f4MvDx9WdgKDdQUf/gpNGk9BBsPKLLhW
         VFqEjmLFJjasBLv3ADz4veA3lxueroTrHeRHQwoA4vJhvF6o/i+fGr8dAKIhLN3wYR5p
         midA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228393; x=1794833193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=CrUTt9LfSNb4v8wzpNA/i4/LJWE7w6fCAQODIAGAQ/JU/r2rG/dJZzxWlYgE9qcjAz
         9fqiX/k0fTv1uj+Psqh+aJX612gqtWOjh4SbdRh82i1+4Xw8bmCFaRBc8ihdpZ7YHQ5B
         X9fest8mdtywXHaJHVoZ2opDDU8+BAAlOnfqR4qiUHUjYW7dAa3eulXB0715+LrfOyTe
         FbRkuXypjCyQsTnD/S2Iuc0mXFpNEJHE/BvK+kiYk9Gxr7+NslQwZEFhwYQCLW2CLqKw
         UETCZfavk3AU95otrP/TApJ1m49gfhQphc5bp1lOfq3D5WCnOSbor5la0WjTugPgWMDV
         EYFg==
X-Forwarded-Encrypted: i=1; AL+hErEIIbwa3a9Df2V4hrO8PjyBu+L6ESRGI99P7ss6Of23z4PNjyaTWlO2P1QFMJHWzqhOYNMdEwD8f4CjwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8F/ZoXp0X1ZoQBlZOWC9ZpiMp4JwYy7BYOQUzf1a5+pDsQZnAR
	bBC9dWoZ4a44VVjTeX8VDCoFWDW7EwuDZ0f3Bj72z1e2jNWJV7Gkt7ICf58cvPRScwrZZiHZPV0
	V057yRqwhQjFzUVygipCv16GB0r8iwOEQNrPBVWcbEoJmj95fzmnOeFQKdoHt8RBrXg==
X-Gm-Gg: AYBFou3i2//eycbWRZl36bKZmFlihadyOiu6l4HI7yZwL7ezq9nPqEVrirmC5+szHAJ
	er4f+gzs1AJWS8LJmVSGlb3Rm1B1UexpiCN0udprh5HfYUfJGxnYqV78khqQO2QbpaHstk/8BGC
	q/X5J7l9gSFW/t8sD8YK/Hd5UKOwXuJCsIkkPKUxxjga6ZkbCTTohDUjEHTw5e2aS0Gun7l0eNc
	nsRYYl/sFRkwCJKzy7JeVtvE74gUIYpx0ZnBBTAMdhlHZn2+C6YeohQfs0DQBoN5KNf0AGHbPiH
	RCGopw89hwGPE/uFR12voQqaLQLlgYIWg8sqsrLRQjCJKmtyBgrgggw2DQV+wWqQWFugJq4134x
	9pvlqnjIp853cu+azPqEKFNrzdwqpOmzDF09oj+Z4YwEMLsN0wm7XAHrJ0eBkhRI=
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009721137.10.1794228392926;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009708137.10.1794228392284;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm9855429f8f.57.2026.11.09.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:31 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Message-ID: <lr67aes7lfunacwf64sorfvuqgqshsmsg72kwebwq7ol5rt7q3@b6vmojxbaobs>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-ORIG-GUID: _Wp_dmSWlteW9tO_0OrUtIowMB2kWRoT
X-Proofpoint-GUID: _Wp_dmSWlteW9tO_0OrUtIowMB2kWRoT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9i6LlU6I1ZSi
 o4pE0pf12/n/w8Ck1mqKwmSdZ3NXHltuujLLYPIxvrtpREkBqf7dU7FPIoJisVS2N0WVwCcBu6V
 1wkLy2W3D2c0UYof0LnjqENj+OMFNck=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1c0a9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aFgLPouUvLL-lAFSJXcA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX6wx6delnQtPP
 L4L7n2e9d6TWEja51ZRMhw+RheSKji6diAdjPLJKsoy0hzdxh97tJPtF+XPNWqq/hthh7+8jEBu
 ER+xIjcoh+XRU2C238x03sTWJVDmo5cwf31F1hRo6xEqM8E4OnjUAf9Gdh4op509i0O+uAmeWjg
 8dedg/03hu/bkusz3BI09Km4XdWdWX84LQyE2rr3KIo5FHDmhxuyZZX9ZrMJNIasF13gnGvVvv1
 oyFSE6hMFpL8pcWF5yhewhnHMIgzgbb7GNqlDj/kI9/s8Pb8yrwweFV6s7shAEtbSfToSCgaK9r
 m+qfV49b/m25jKFytLZgPWVnvLtlLoKkNTpuHuwYEpdRGnCIzowkZIFgOu/bXT2/SxPlVKd/UHJ
 8FS7CBrlDFPx1XsgqKq+3E9j4vuqwMmUuKuOZJdaMVcAcDEJybam6fCcVVUo7l2N3LkULXvfF76
 vH0GGteCXPFGwJ5YmuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:29, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
