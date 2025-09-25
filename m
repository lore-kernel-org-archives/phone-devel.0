Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBB320CAB
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833515; cv=none; b=IiaDPZKTOKVAapxPkhzFPUTDJ6hbZHcGQGtdvoKCnOrV4hvWfnbk2U5cIdi5aR+OHQsNV8q8A5dqr/NLzqXssKocC8tw3VJFgqBP0XedPwIBT63e46j2NMWuVZw2Iq6Ateq1yNMzrDRfUls+K1kCC+BnXQQEE3/DUOrKnotMWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833515; c=relaxed/simple;
	bh=60h+PvBhk9ZCE1dSaYvz/x8//Zfi4LUenDLYPEMUE7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtjN89cy98rFrILOyrYmpLzObe+oRfx45rAwdZ6fo1iBEorLemTWcqqkkrFSFFJV5tHcWFo1lBw7bGKBasdOUYmHCux9OS1+tjXJuBJFz/PU5sWlUf6khIqyPaN2/Ac7AmoGLe64JccaG/KfKvP/U9QmhYL/lxdqH/KBL9iJWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXUzJHpY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXUzJHpY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQKqX007999
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 20:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B1RTyPEbqMfs/M5EeZCCAWjw
	5x88kEh2vuNN32oz2GY=; b=FXUzJHpYu348w/mgaXf8/0uvnYFcbJEqSliTBTPt
	zTGCstM0WZVIM7M8GrsGavu+lwOCgZ/RF0wpVXNtVOT5x+r7/DEdr71Par6LH1Gh
	wKnwwtqE6YlVQ5A2LBbUaivNBJ/RMNq03Cn7ci2B/wK092g/UovboP903xs4Du+r
	K1v6KOiz0OvuvGVoYoHHTwiHSXjUU4VDbmTFSHTAihcks3Ly9BR4Yu2ksZ+SPp0v
	vrXw7MMUHizrjugYAkjEyWVBsYldc91QbYbqYPE5JyTayRa3fESYAyTzpz60J/xy
	rNFin6fnuwYKPWnqaWk+ml3DbqIl5q90wFYbde4byiqMIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vrbc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 20:51:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so33700981cf.2
        for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 13:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758833512; x=1759438312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1RTyPEbqMfs/M5EeZCCAWjw5x88kEh2vuNN32oz2GY=;
        b=cR3HWe960w4PixVojjJ+pdtdD8iO6HmPtd4Z0uBjS34VOO76R7oUrO1EJ4uRfXDQwK
         BnUKxp1EeuxirKatWYG1sO9UvPXpslwisCPDRP8K3rAfFWIZ5Cla1Cn7InhhQ4EWcLIM
         CNM+yUmLU6AhRyEQlfx3O5RedMbHNdiav8MVgx/Im/esmYyjgLuz1ZaYc9oSRWLQviWG
         rAjaH+a0DuqJmBbKu1ukWOfFupYo4JfhdoQjdUSuVl04RfR64Va2Bq4lTBZDi7eUdvmv
         LfERK8k16FyIfPXKY/H1IQO0jN/eB+HK37ijBtUIKvFr1+z4BpcWLNlV0C69zLLgWub5
         HCUw==
X-Forwarded-Encrypted: i=1; AJvYcCXL1ZmAt6V3/3cvZSQvb6dMUgr7TXSN03KMm6p7f/rXX6X80/CfeglhCiDJrDHqXxp+z0Gp0599KukMkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6p86FdB+WzH/VX2KQrljnpXmx7OewHfH/Pq+9CAqPbHP9+cJq
	20ZMLXVNDnMHKgpdGIgrMFQIeRVJIWAeq8vEbWx0f0dzpKGE+MR060QCt6IqjQF+CYpgPPcO8wi
	IPMrvrV+onKZJubYV+pBxa4dxE+TkIQg9YS6KfcsE6oZ9od+2fy4j/BAstvq6qdjnm89ljVuOhQ
	==
X-Gm-Gg: ASbGnctghgW4U7YDs2T30mK38oVHZD+N4f1n6V2pkHD3oA9/ECnC7dU8+Pe4bft+7pe
	Uwh8nlfOOZ4PIe47GG+twpiRRlcRmW1xGJ6OE2VeXjTq08STRxgB0mkSuwDFCmlTyDCQlsL52YR
	CE/PbQ4HVMFzXbyOJXzhUL0Bl3TKoLWUmdz+lq6YyNnNiRCfJ4uwadMIqzZMf5+RCCbb/KjpkJ6
	QxgC/g7HJvQsrkAeHEWZDhqsFhmNL1qY5BmU8fLzhiu6OXXG7SUwHOLF8QeqFPD4uCHKjfaDVh1
	XJgGSBI1xVVXnyc5Zs0oo0y4jlvr7Qcyx9osH7YsfcIxaYnCQxmDL3sSqdmsKGI3qQ1AL6BOmDA
	+uBG2Z6DFTPLSB8EwsIy8L4RS7/60jnEhmNWxI/NOTGP8VLvsxCdV
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4da4cb59235mr61629741cf.58.1758833511677;
        Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKR5yjoppC91j/VvrgzF8NVXXjanhDCZEwgkr9/7TQbyr8UNZPPV3fhtTNkrc+EffTq5DWqw==
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4da4cb59235mr61629311cf.58.1758833511042;
        Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a31e48sm1076929e87.110.2025.09.25.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:51:48 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:51:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Message-ID: <mdgdqm4qurstamxyt4nvkrabf2k57sf6so7qp7plmhtpqh4qtk@vohj4ofwhyt7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
X-Proofpoint-ORIG-GUID: hL6S8KVrFx-taOozOt2uoXWIWTlViPDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzcCT4j4F4Dr+
 z0a1CXls9uX66koCSeoo0EP9PFg75vIvWU3jZJ+dZQriKKPm0XsKZk9ORSqY+Hj1pZblzrKIGOy
 bRRHf6eV26zspoAq4bytMPGIq4gjNdW32Q2yq6M2J/EHerI4saQNB5HIPdVosIES3DQ0TnR6rh4
 ueV6FonXrazSNGVIcfBY1vGVhau0/zVEAngIb22ZbZQ0d46AMogGhS8YHlL9GKy4nyE4bFJ2FBA
 AwP8BzPdwmTw5kljtuZR+fYeE/KnLoYQE67vxtGgNvAxUP1UISVeniJdolcr+jsflFOIQ+19Prx
 TRrZo0NoUaFV7w3KbDn7iW4xZ6kpRrljsxYKBpFpkNztjjIYLpOofzdLOMjUXDZdyVbVB79NXKo
 rcMwgwoHGzAH5u2fMuEl/mCxyzwZMw==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d5ab69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RREAxZkodCCEBgaENwQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hL6S8KVrFx-taOozOt2uoXWIWTlViPDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:12:48AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow up commit introduce the proper device tree definition for the DDIC.

And the reason being?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 9b92a05791ccf99061ab7a1e01937bb832a96fe6..6c1249a224c8a170b33fd3f331f985f16914cb2c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -56,8 +56,6 @@ properties:
>        - panasonic,vvx10f034n00
>          # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
>        - samsung,s6e3fa7-ams559nk06
> -        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
> -      - samsung,s6e3fc2x01
>          # Samsung sofef00 1080x2280 AMOLED panel
>        - samsung,sofef00
>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
