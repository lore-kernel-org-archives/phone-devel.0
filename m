Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389743;
	b=3vLcRj9iAtyE9WScRIuRktWzCGmvYfU+rTIIoSyF9Nb3zSPTJakux/BhUC2xjMPCBT6k
	 SDO/xK/X8xf4av0o5U5lIjglHTeI9XyfwZaCJkYIws9yNgSqUj6aF5E0CW95RUjqmehNW
	 G0RmHoNZo2c9HwO7PbTbDvF1qdFiN2mLhOC0iCjoCfAvIj3AcJ54gMYdytlYFBzibUZ18
	 BIq+n7tg4rsvnI2oXgiPlyfEjSqCeR3OJFqhhSugrkbvE2zxi4VNT2eV9cErxH/jaYbUo
	 F2gsyh4ntrH/OmBsgigaXq7AQFtUTOT4DLqoTuC6wjwFW9FQVA2G+89ODSHeZfQ2Djg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389743;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Z8g4xiibKWQuuJs7EMwmXcAQgq7/Z7zwBqVvlgwyNzc=;
	b=yMOrXOaPdOgrLG/aqqANaayMxFscBi2xvYXI+HRzxmuuoVUCzx8yFU+FVI/Juv8eDWyf
	 8NZyZLraK+Vb5H+Yv3LlQIMcSiARdqnjK/juO+02W/cTPWhST9IS5N/FfHL1Nu199zeJH
	 bpb11JfyFCEcYakw6r1YW4pEEVLrFtlYqsyMOCZcGKfib2D8yK7CRmPHXvhntkcPnb/Kt
	 ZUdWLFcKYKJlmF6bB+77WsTtLJBET7yzlD/7jGfOVqrOTMyq5i5rKga8XeEDnBJZzGbS/
	 /GLuDXMjqJJQPuaDmt2LEaJi315SCyrcIRMswly+oIXZicE69uAgBMbmx399r4dXUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yPk7oTaK;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14F606A31C
	for <phone-devel@vger.kernel.org>; Fri, 30 Oct 2026 19:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E14F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yPk7oTaK
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id MqZbx61vIaC0UMsazxDOek; Fri, 30 Oct 2026 19:49:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Msayxf0EU1xnwMsazxIHgi; Fri, 30 Oct 2026 19:49:01 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae4f4ad
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10
 a=AKGiAy9iJ-JzxKVHQNES:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z8g4xiibKWQuuJs7EMwmXcAQgq7/Z7zwBqVvlgwyNzc=; b=yPk7oTaK9jPnNUqNMPC6twzpsT
	nytbZs7aIA1qfH8e9yM5XmhTrSl/cYbIZ9RliN0XK6PH+8fH6iMHI1gCwt/eOdzUc49xyR7pm2jYG
	R9wLgSVekO9zz7XW1C3SjWJ2jdanQoPmO4H3xTNiPdbDJTuDCzQpc8aBllvgvys8U4au70SjQAcVr
	9kcENVpW6s4Z+c++LnSDgqh02SbHMxe8Bio+xFCpQVb4Mg/zNG/QunFRcwYu/SoYh8Aehzm3qPknX
	EZ4s/wFn4ZXU94FbWoY7yOx8zm4QD7ylqGwONkzT2WrVTWpzZjoPkVFtX5kt1BNNAWsdLe/GcdbYI
	A7exSNtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44054 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsat-00000003tHT-0RvI;
	Sat, 31 Oct 2026 01:18:55 +0530
Date: Fri, 30 Oct 2026 12:48:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v7 03/11] dt-bindings: watchdog: qcom-wdt: Document
 MSM8952 watchdog
Message-ID: <7ba73247-d832-423b-8020-21cc135cd02b@roeck-us.net>
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-3-ad748ace375d@mainlining.org>
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
In-Reply-To: <20261030-msm8952-initial-support-v7-3-ad748ace375d@mainlining.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsat-00000003tHT-0RvI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44054
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPm8fqs+1sWsamGTskY7mWGHN53eQq5FL0pXArwce3eR+737oy7A8fPRJbXeLOkTwxy3QFalYe3yeptL8GscllWVS4lMCFHZaEWAK4AyNJ0ZFBRJUgb3
 zNH2btkhoIC+TUMSjnFaoJX2RTsej6i6PTaz/l1/nBA9+2/ZKYk8aWDvWzzTR8XAcQuk56C78FBS1cgFh4W3o127dzqexkgb889UvOTnyQgL7g8Iiezou9id

On Fri, Oct 30, 2026 at 12:02:34AM +0300, Muzaffer Kadir wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Document the watchdog found on MSM8952.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
