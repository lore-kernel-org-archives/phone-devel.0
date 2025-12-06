Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C1225397
	for <phone-devel@vger.kernel.org>; Sat,  6 Dec 2025 04:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994912; cv=none; b=fAa10aJ39488G69BFTmT5xN326sNfr7o+DVrMpc54MFaX5PzxgY0WXXgu/xBJbvCIYz+yQi7Ewt1bQesQG6oYeG7x03GsGO53P0AfiUtQSZU1GNbzb6QDMZm3583XjScVzbPE18OgDoa2FwINL0ZyXzTgmgv+Bn/uXja5dfID3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994912; c=relaxed/simple;
	bh=GUMWntgtobx6l4Pqxl/a+f8DlTB5j4ESWaEjOf9TrDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTnaxC6gOYDOt7Bi5TAfIXonW1VnqEqnGYtU8jdu96fb2eiT8nvno/UA6EzQw0Hu2fp8Keg698kIb4XNccakppaUnA2jeMUF9hhlprKDGjoWq+IKj529JLhWa1oC7IG2qlB1oQuLhy+VY3gfMg+dnMQTFkoaEivdU0rgttZIcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlWnlHXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHVMaiFm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlWnlHXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHVMaiFm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5KYKLr825972
	for <phone-devel@vger.kernel.org>; Sat, 6 Dec 2025 04:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MIl6XBPonHXUnHVSJ8TMiVi2
	oVgOFanoHbye0ig0/PU=; b=MlWnlHXha51f6CYYMYyBjEJ4fzL9OfWoWS7IjfId
	stpyBdAZJTADRk71ICd/gY6r4Jl1TwFOPENsPws2o7sxAl9TpKF68CRueG/S8zgD
	5uPYyt65+E0WpsqFQsFLsYVED8K8MtTFb4kcxYiE0vWQCMVEgpr2UFsi4taMQ4Vk
	OlDNxBsh6H8TuQrkXiAeb6joIcw7sFQKNJM4Y6SnyN2Vh8aXpKMFJCkuh/+C4ci9
	RZNvYooNqaQdHO00/EftfnhDy495TWW0/4GVZYBCReHebRFH5h/drP6YDxqgQnKg
	Td/iWmBrKqkOo5vJdwTwaAllM0DvqSFIG1G0+HB8FYGXNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av6hu0tm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 06 Dec 2025 04:21:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b4f267ba01so838963585a.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 20:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764994910; x=1765599710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MIl6XBPonHXUnHVSJ8TMiVi2oVgOFanoHbye0ig0/PU=;
        b=EHVMaiFmQNyuXnh7WSIXCHNURGzOD5hKZxwQw4Ff5tzbjuYbQdbZ1bbv2PCS4wFT6d
         X5Dwq92LjE/ODsBAPnqhHqIvOzekdbn4LRJjfJl3jj2CI6bSnDZCJx+PIi4hg8bqEtYA
         7FP7K1kc71xJKxPcW/f/wYYFHrfrNxKQNLfu+EJLQmM43dw4q9aJMqjF42i8+IhCTPdG
         S55Z/cBUkk/vO7885gi+2DvH2VFBt9SklCvXj7VE83/mjMJqWuc9812eLjcIbL50+PNt
         d/xLncZqrI9ARq4fCtdEO854OF7TOn6eqlP9FfDKdAOuD0sPFaD2ApL6eFIy0iDuQcot
         6WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764994910; x=1765599710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIl6XBPonHXUnHVSJ8TMiVi2oVgOFanoHbye0ig0/PU=;
        b=wVpmYURWKQL4+k95/CnXZXWa5m19JfgnJM3PGreRCOiDly3lODc7L4QsLwbCxxaeHJ
         iGJQhGDUVvB86pkcUfqpwgWapUoIiIWLuVU0a/u+VetfAjQPKQaRP0JzwldfZTuJYWdI
         IQ+uE6x+0s7Pg6m5+z4HWMDnnAd4c5nyCP4TNKXPZ+tOYauVPzDj00vQkrJ2kV+196Jn
         UN5Mcm7dc4KlxNnn6XS9NQArYf2kjqS0wNgYOMOsJAWQY7EdAXpb8ujOeySAJq2g2JvH
         1IuXkyUey/Iuus+v+b+Bl8d8yKpHqvBabA/Lu74CTKSm0gc18M3Q91qv3ycoN2FSBiJk
         vreg==
X-Forwarded-Encrypted: i=1; AJvYcCWiEWl32u4wmyCeN82CN6lwTJsF2X+ZPW499tYuvgFqeiiymXroECJ16ibxnPCBszuudjBsr4Ga2OGSLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9jxfjHo8TQkNfT+WPXLTNwUsN3TqV496vY97pVfINhTP9YYP
	BAJDWwv+O5eg8oTOoEZ0jHMT11l6rpIgXEcuCvwpspREtsetxUXt2funsQmsT/nditq5EfF9cKi
	cfjjrUw5hqdVaG1nNiPZKS4CXoNNtJF1Fc2K3YB/Fn5IE2qu20Nn8/4Ka2DbsA4oFwg==
X-Gm-Gg: ASbGncvyM/shh8L6uKOp0EQUjrCgudXQ2wiPZAhx+DOBnB9Z9EgfR3wJBprJ3ZW7+d+
	ynQKqOigPE2UalwxxqyPiK7A03yykEd5N2oWIcaDhEpMnjcSGgMvbQyzL1N5m000KizzZgEzhhz
	HGnycmvXcFAA7Cx1r82LWIdATcT+pzDVAmYiV0aFkldRdJJf1E9xBOJMtqNWv1BzAmol+NM7eEZ
	ZeL/LbTJL0JPuC4Ae+FJWaUcDTM+XSvNXX6SZmRfRF+avHKKErnqXUhDx/hBzJYDDY96uJWvj4b
	/T3N2Lk6qb56P7CxkYypfWXAPVjWtG0sm820JOwwfF12+lYQMqRa91jHLXHXs78gZMqq4PgQJtl
	88PsddbLPwZkhOqyY2nz7yCGjzxagYLT7JQpZVhds31Jph9hNZVx69qJnNTgdU8wPSbA7Q/x6FP
	/3RC7k7kRlmhOT/vHEDUZhCBc=
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1285812785a.20.1764994909519;
        Fri, 05 Dec 2025 20:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELa5NmXVgr9Zv6oxMywPl1XxvP1p4dQoPyF1U0OXkr1ix7ky2OcNXwph+K27pGJXPWF5P6yQ==
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id af79cd13be357-8b6159b7a2dmr1285810085a.20.1764994909061;
        Fri, 05 Dec 2025 20:21:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7dbsm2064122e87.20.2025.12.05.20.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:21:47 -0800 (PST)
Date: Sat, 6 Dec 2025 06:21:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Message-ID: <3272g7zalfqdyobcic33edhiqsj72redn7yl46s72giv45adin@ggvhorkee7yy>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMiBTYWx0ZWRfX/HhkdBclIkqT
 2kZmc/XcZUY+8mzSQyvniFxUI2DNQEOIlHjJr0KLnKz9PGfFW63R1x4ra7EqocVLBmYaTf3BjuI
 vbOT1HpaaEhObVH/5KV4YThW7L5scAzVpRfv1YCBcWKRP5BcyvtLhlC6LCe/wsEs2DaWq1/wtvN
 2XLvKswO0770EvX1sDJZXI++ecb7aE6802i+5u9SK1LIGyisXmVuQQRbYP7xy/fnmfYJuQKaS14
 UXRN9QtZWXYJnLqkzm5bgv7sPHJlajyAmy6HjPThZRQL55Lvkx3V+HCQL40Z8VPLNJovB3SqGZM
 L+JYboHdNQ56gkIxKr4rnZap9UlOzmwM5h2UmvF8e5HDFks0x5/HGIj8oNwmsR5cEMUf5DFuAdV
 x9/q6gFqhQ38/jPwh1xWaqmcXXvXJw==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=6933af5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PQw9IP25ZL8ef7FIWD8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eds9EjZQl0jQtPJYS5ODB_YY24mhjD7O
X-Proofpoint-ORIG-GUID: eds9EjZQl0jQtPJYS5ODB_YY24mhjD7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060032

On Tue, Nov 25, 2025 at 09:29:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The supported panel is LH546WF1-ED01, add compatible and adjust the
> struct name to reflect that.
> 
> The standalone compatible lg,sw43408 will continue to work, even thou
> there are no users yet.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
