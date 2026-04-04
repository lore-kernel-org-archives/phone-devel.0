Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90283A92E
	for <phone-devel@vger.kernel.org>; Sat,  4 Apr 2026 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339688; cv=none; b=uypRFfL/f0Luyu5XPu/Bj9RXap9JYsyyEYB86I0mxKs5LkJdtCUEH8xKkxuObFcNfWNEwhA0UJzaLo4F8qngnRctCYen1LpNJrcJd0ncBnvqA9M3OFVUTk7tu0x5883HDkvAWCFe2hAJXV4m8IpGcL5lJvsFfi/5Sd9OmzwHuSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339688; c=relaxed/simple;
	bh=u+koxI3Yoe/GinKMBs6efvqTvGNRQbfIRJCp+dtWl6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEtx1m2hvEJd34GR/NWFRzvlA5pDx0lUTJiIH6CcoPdgywn5N5u9EWhNoL5BZ0UH9ikD017BlVVs4Fj6WU8+5YqY6+X1d/i+N0PRzLJQGLT/M9nqaUPBm+kIN87GjsELixvP7f90Dg9wlbKPaBNsu+JaGEVKhgtIaS8Bu2QVH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2B+Yzmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2f5e6yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2B+Yzmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2f5e6yU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JF7AO3591533
	for <phone-devel@vger.kernel.org>; Sat, 4 Apr 2026 21:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=INGDAgs64kjYvsGtYYAY/66g
	nxazyYC9vqCcyr+LqGU=; b=P2B+YzmfaMcCgwrkM06rKzlcjL9hbEkLKma1lf4f
	plGRK6eCmkF5Ii+81zPxLvkJcmRgVnpyg7XQM0qCJtO2q6WHplF+0WXzcYipcdeK
	7mo/vDXIY9ih8lp6Op6dMSwJiSoeeuKqLQCvZCzrQaTJ3kEbzI6BV8ybK+S4hP4W
	BXCZ2VzJtgiGnfTNzfe1/uGD8w7ZhlTaRKjmHznpYKmpubTdM6NG6iqvNWFF1qNF
	+OEhnU8ofj0fl4NPSY0GiQ+2Ijeh/RIL5Edv7YR62s8QzwEwEaG7DHSr4lnw0ia5
	nEavtQNlunTs9O79tYzc6f68NDWVxrN0oGWdcghX8NE/hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhrvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 21:54:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so82838591cf.3
        for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339685; x=1775944485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=G2f5e6yULwRnkaVtDxuJtjk+M9ImPHl9H3+sd5ciSplubYG/uIIEfw2TWAzbyqmN4r
         nTVNRYqX5QebWXfjkuJJ2kl/4A9khg4ZDmD/OW2hglVPFvR7iuCSCqsAb9hH5JGHsfVI
         d8mv78zGd4Q6XIJrW5iUkZGJc9pTR87XB9PQNlBF8ygXJCju0pyFOs3ftdgJv3CxmjCc
         3IRDgR09h/+Vvrleq/jFWvbiKROiVKhrQw6jajxgj6UL8KsODzDKZn9RJJl6Zkv54gk6
         G6b2Gn3XQy5eHO8GhCTb+MmwsQuMnq8RWyoNKZgCyXizWdNpuF2LnDeXvIbqOxfspfiT
         2P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339685; x=1775944485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=f3HjcGWXHpo1f4vfQ/Ppxb1+J/W9DgxOrrOyCRVfTjW07bkhx9VnLqJF90EfKoqhJE
         8BDiyL20KLxEIKCNRMO0xCr0CqXQmV570dzaY7sgjIlxeUEWmmY3C1aClja6W3ISHojY
         Tc9MWi228iTBb+7D0PLnKRtG8TvILdGwa/aiP0+EFl3do9VGYk8M2jZYOzkGUykPFgma
         FrwxVjBFeyQa5QTYQoQz2GunGoi8GAWawyxWgLf5uRCiOxQP7uHLTO3fgNib/zkdOsu/
         hVhUx+69rSx3fIfCHVALoqmE+tdCFZhVtmh4A2PMx7WoRowky2hcu9lBq0UwSWCNcJxe
         V52Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCNhJCte0LDTfWSOYV6XYR3HUgj/DpAgeINakB6/Qjccg5y9EhgdFKPOju/lIy4g6ZE1tFvbHKMs4tkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYHzoyr0U+5up9LNNhXd21Qe0tTXTDGbg2VGf7m9F9MHBc8K+
	VKDV3rWh7xhsisb5h6qNaREeM44wIcH/uK789xtBVa1uiOjkUzAeSKJZq/vEB2RveS6r9DU0E53
	JkCXilM72ublXUAnvRIFEU2ojI09bderPcUxUp0lgnYOOcrdoLn8hokEUVuvCjs9jLQ==
X-Gm-Gg: AeBDietUMUN5w6Tl6XAR8Wvb5m9MnYtU7n4OrrSPAaIynqIf38VImaT1EPJefvR63Y5
	KLCP2NYevodNopiHf4bndrAV9Ia30YU6410Jn7nvwqnErFnsORqbpRXFZ0JFbm5emxGWjU/ktnj
	cCSnG3uX4mT1josOFw97i3Yn3YJ5Ul70+M9f9iGk7iP92yUMSq9uDvHRPeViwPXST6BeMK9WrEs
	/26qYb/W4T3TTVRNzutnMT/dco03JXFkbR66FeRv48jRmzzk/Z65AHJiOBoOp1w8cd5RfpXdcFI
	SSM9hBL2G0E+h8Sz51bxgbc3xNbKioITVzXO9OuaOfCY08Bb6uCahtiThn9Ct2mOpFrKa3OZPwA
	m92ZWH5FZwZfWD6PTmJr9o89+PDyRYByLIUaxp3SrBmlMfHhDpN+EWtKp2jqqvjWA2R9qZnj3Mq
	hhbL4XldErsHDaIpxBli3gK806ZDfX5MQcTd0=
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535761cf.53.1775339684874;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535571cf.53.1775339684437;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm2351011e87.50.2026.04.04.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:43 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:54:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
Message-ID: <saj4lkm3cwoihwmzensubz2c4xz3b6o46bwevnsnwk3s4oxgp7@mx7qnphkxuos>
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
X-Proofpoint-ORIG-GUID: PfvA5dkjx2kMgtvHho24LbVZuh92xN7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOSBTYWx0ZWRfXzYQtH/cF+zyf
 vTZArhCubaagZBhpISBA4CqpTB+HJEJiStqqIpdI6rrNYPbwP0MvyuOpThgP/q99Z/c6YOY1VZq
 vdPyiloaifMp9AIoi/j93qRvka8AkYypPStR1JIFekp1L0+4KlD0z1lBZW4Ibb9yyF4wbIR48FG
 GCy2zjWcnbfYflsQN3YVZLqNxfAbVGZZN1t4dVSOIn+GoIvLZyMf6w43dc1IwCwMOz24gqtfu0z
 tRtsHB0rHkEzJ/8EuLYu3q0pOMpy7f8h83NOYndbPSsbI6Xwp75ws4ys5++m5tblpbpTX3zkvud
 Iz9YSSUqviVTK3s3uOlr2S0g/a0s1hYD+y46Gt8OZjMOdCOoqi+9mqcXU8UtNW7FIOeuRQktYMm
 8at1T6B0gzn8+qc9yLN3EaDR50mB09PQZZr56NjYEq2ofMVPNDY6RHU9lnx/rYZAmvjB0XO0gDK
 PM3mlJ3VxCxosxHovCw==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d188a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PfvA5dkjx2kMgtvHho24LbVZuh92xN7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040209

On Fri, Apr 03, 2026 at 02:33:09AM -0300, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad
> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm7325-motorola-dubai.dts   | 1456 +++++++++++++++++
>  2 files changed, 1457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
