Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3EC36D501
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926689; cv=none; b=VELGC4Xg2rCWJ4Jz9yDQNuIGiD5hIoLw1ffqB+cmeg6u/nB/HYtlSmak5vt7VA+yBIO5nXvDRPiqPlL/42jEsLdXYgb6qj1Au6qtlWYC9NnZ9flk8AsecjDgMu5FRIzEE9ufEgaTD9cUEnON2v7nGQdxapqGiFKIPtGDqFqk3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926689; c=relaxed/simple;
	bh=zFhH6mV/BzAsFmDghDXzIskq9NOQRf0vUzwBxynZo2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Akj1KBgi4UrvM0d09N4Pxy4c/+ymp8codNZV9JRqT94tGjLszm6NjAeX4WqneunJWRzY/gTVQLk52bVWJeuCQY4N+SyHR1zTHhlJKuZQiS9kY2FZoXikgGIM5RSKDXnrY+3l29fC3PaIEMpZDT/d/nYyLktBxNjfUeAQAx5s3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFcHJDPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrY/Cu3N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFcHJDPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrY/Cu3N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4M0fl3125637
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Ozg5KQxkZbUpcAsSqTzyj9T
	MGI9JFbx2Fui48y0Buo=; b=VFcHJDPA7giBl1Eg4EVKfwLhLxvwkPVZw+I7aOJW
	6ka/4b1eIpKCmdxH+ClR0ZNX4AcgiOExPgeGGdF8BQfRWhVYIO78cLMbJUZI6vDZ
	iaSXAJYAOAA+0+hHzcB+IePAjnChSVi+taxFhu9qiTXqzTVDYZE6aZTFFE58rjvV
	/XnXHlIJdvjuC9HcGIhFKDmi2RWzSwpxhLPavz5hq9Rj3j9Bnro2lQSCDr/flTPa
	7UWL54UJN0fRALW5j/6IwvZm3dOyeA7vmkKVMfXB6gmT53pcO9bMLBeW1CrQgO/D
	C2Ij+ZDcBhwfBfma/oLy45nrpXrklD3YUjVLnduFBi32pA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8tpmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 09:51:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so5159793285a.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771926686; x=1772531486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ozg5KQxkZbUpcAsSqTzyj9TMGI9JFbx2Fui48y0Buo=;
        b=WrY/Cu3NJosIGspaadQZY4JGynJ7jgUQkEn+3tD9BoKA4DxtzFJhjbmkZtzY8nLV2W
         Ippxq5ZLvK3pWiBd4nfjHm771o82BQr0HmApXbWKxE7f5ziCP8Ey4aolp2H20kIx6vzi
         ZZiApvJ6GlV/KK0KXDVetTvyFyiyBYWFTifZ2YFwe/BUJN3pP4niumLWG37m8VdIloIi
         XsDl4s+I4BVHVlJ/8FyjQv7Hgcz85m9DJ1zCLZ+Gkw+kAFOoJc9CVP7hzbmLpg8pnPaY
         m0jyz51JiqJitg1T7+bz1hBaQVBKqoZRcJQO14O+5jcwK8wvvh5Tu+WD+NFz7/S2vvJu
         d+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771926686; x=1772531486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ozg5KQxkZbUpcAsSqTzyj9TMGI9JFbx2Fui48y0Buo=;
        b=Y5Alg6fe4L8+SC2cBtB6EGDqwTVTRVJ7untt5KTSVV3myNaORsQtXJfjiv/p+I6EAL
         H9RaIRCotAFA/ClQQTJgk8G4DLoDtNmkhJdkbeeKk9szD+jgmGwQjsosELXUEFJjyYg9
         KaWNo0/Dz4Ji5C7dXbYxWJ6xO9RZOnotimj3Crjtt1XRLi1s2m6PJepldqtabb/f3Mdr
         1Bn0UAKpvMEth43KwLzZCI0rjrUyeyNunuFrZyjxooslop2aUCcR8Da/89Y1kgrw+qZp
         aUTAUOIgIBglYHWyG5KQ8TgpIJ5+NThJ8JvMobLN5GThueUa2h2Aoj+a7YudZVmZwADy
         SR3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNkQ9k4mU18f+EzxpVrz/U/7SDUp4i96zsHFtJm5Qqaw6undMzExcud1YGQuZrnkghA+ebfmMmT6AGBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaeEN1uUGGhamzcOSN9dGaZibZYePvRUPCmEa4TmKZ0thWcgp3
	JWMxHeas8m3q4vA5P/yN1KDIOPU7QSqvyho589/xFooKM2vRiwTNBi2SXfa7Nxfq/57gnVJ4v80
	663wOAwHidalqY4PJWtwlUW98Q+28hGcdCDRDBiDEXBRSbrTn/oiIM6EMYJO5uuH27Q==
X-Gm-Gg: AZuq6aKNDzbryr8LnPOOGcX/4VvQ4NXIJLbWvQVqKM4BK6e3wDuJEehltlck8nwrc5n
	vfznFLhO118yOkPXnnjxobsKZM2/sWwoiyvVKx+JeRWJa3yIZRMYbNz+xW9nan6K8wE4o+Y1RyW
	6KxHKXaYAsV2BzvnG0+QodTxa1wGtrVV/6TaILN83dpCcI1Ou02GAMN57HnJyilrTwH8hfBLFXr
	dIbO7aLQXr4oqU2xHYHS0/xes1SN8nRr+O5j8awUwMX2U6Px6MTqN4/0qwZzokXgGKVuFwFk3Hb
	BUT1RJm98H5euFl7ITV9HJZxaT1Mv3bclHp1RfufDjYegct0K/VakTC7BThx9drsWiLZANP3gbi
	2CR4Q0Cc64Jt4aaKLor+ayvMtxQLwu7Nm906Piao/3VLoSxfG53E1rYRFtoRY+P3a4PdqIJn8NF
	DipCeB/f0u0YBYZ0olz7ltxBuVOLWNYB/YduU=
X-Received: by 2002:a05:620a:2905:b0:8cb:5176:ef8 with SMTP id af79cd13be357-8cb8c9e6256mr1277713085a.8.1771926686364;
        Tue, 24 Feb 2026 01:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8cb:5176:ef8 with SMTP id af79cd13be357-8cb8c9e6256mr1277710285a.8.1771926685819;
        Tue, 24 Feb 2026 01:51:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13675sm2075448e87.21.2026.02.24.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:51:25 -0800 (PST)
Date: Tue, 24 Feb 2026 11:51:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Max McNamee <maxmcnamee@proton.me>,
        Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Raymond Hackley <raymondhackley@protonmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916-samsung-fortuna: Move
 SM5504 from rossa and refactor MUIC
Message-ID: <bnt54trgmwaubeulwrfisfmdwxnxugyruuhblrm2zdwmh4qjzr@57mzjv2vdj65>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
 <20260223220514.2556033-2-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223220514.2556033-2-wonderfulshrinemaidenofparadise@postmarketos.org>
X-Proofpoint-ORIG-GUID: yoEaLqgNNa-ENMt0jndu3-nlF7oI7kjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4MiBTYWx0ZWRfX9xdKy+CcCuq3
 cQa/Fz4302ZJIDyOZ3Vxdr3Q9VJ7ONqyKl474M8rzPAAdixbSbXCRWvLR/zQHn6svdgZB4kY7GE
 ByL+EhurPZdZcHxywytbjDYGfqd5rONHSmtzrmFc/gGwFNOcF4xLDyIIebE82F1D5d7KGTpB8kC
 5bGQ3YpX9lv3OJf3phGu7AS4MVa9J65wZXmkmCrUDJnbbWQYrXFd5iodta5mnrWzYRfavU+GDv3
 IL9Z/W4VBXr7eV+zORJ0wGeSeokCmx06FAP37wDXoTM6r2zLK2vBcgG4xPrx/KS3efzGPuJSUXE
 CPecwrURI7CecfvweKRhroPC8z3obxjFfc36Zsv3ON2FSe8w9QROOiAz9iDNOvPB30kb/sGfnCe
 UzB1eGGf1vVknk1m12duoSkbDJ3MuzFDIl1ytuhRxV6J8mv81gK/THctrJ8LWzL4KT0KBUfcevn
 blKsMG8LP9v1aa2girA==
X-Proofpoint-GUID: yoEaLqgNNa-ENMt0jndu3-nlF7oI7kjL
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d749f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=CDg4bIe1_nYBnyjI12QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240082

On Mon, Feb 23, 2026 at 10:05:12PM +0000, Raymond Hackley wrote:
> From: Raymond Hackley <raymondhackley@protonmail.com>
> 
> MUIC varies on fortuna/rossa devices, which could be either SM5502 or
> SM5504. Move SM5504 from msm8916-samsung-rossa-common to
> msm8916-samsung-fortuna-common and refactor MUIC.
> 
> Disable MUIC by default in msm8916-samsung-fortuna-common, and explicitly
> specify them in each fortuna/rossa board.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  .../dts/qcom/msm8216-samsung-fortuna3g.dts    | 18 +++++++++++
>  .../qcom/msm8916-samsung-fortuna-common.dtsi  | 32 ++++++++++++-------
>  .../dts/qcom/msm8916-samsung-gprimeltecan.dts | 15 ++++++++-
>  .../qcom/msm8916-samsung-grandprimelte.dts    | 18 +++++++++++
>  .../qcom/msm8916-samsung-rossa-common.dtsi    | 19 -----------
>  .../boot/dts/qcom/msm8916-samsung-rossa.dts   | 18 +++++++++++
>  6 files changed, 88 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
