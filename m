Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800801;
	b=BzZkymFdudUZqnODmwwKCU1LYHc+iQTlOHc9FAClpiI7YH+q+nbGB7s7cRTlSc35ugq3
	 lH9FXX3muRvvSw5Hn/4kI04BTIixow63+l3E8LxyC8KQVlmsYb3re41+yPgF0QmKKQpuQ
	 sLAGWgu5eMumTuh8rBkvNsCtamWbB9GYkQnzoTRUB1yVlvlNej97PnBY3LBly42EgDEg3
	 7ghk/+vJRvoS5YdDejrPb+qth1aD1icxGeXKLxEqoIiRGMOK25t0EUP/Nl1HA8W6vMq1V
	 Ia9uOGMwKMkLwatBqiwhORbSLwyQH0WpTYbN1KKouN0FMQop2GUUBwwKRWJcxBzjNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800801;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=gfd/7VCjro92k/KBmDpdCLiBgdQ3+GO787DYAIBt6ZA=;
	b=h389QVkQqtOUpVFABR7OzdxTf6t4XNs25KhRUDRbXv09JYUCHpfJKAtVIVD8KjULeq0R
	 IKEM6enfI4ClSXsxFT8Xf1PGLBbh1XaENOy4bSo/Hyh/lsvXBkNl0eOGram1jShmFFZPm
	 axyqzlovXWmBVI3WdIfgHLN5go1i5BF/nWQOmwV5VUNcuIF8goakQabVymjfwhGLCvAmL
	 dwQr4Nsfx+6zDl4cC3UmLWI20aRm03Q4f7qudH2CudBdDoKO4z9LO6dIsS/8L9daolyk4
	 HrA9dykjKo5f6FahMTJBD4IxBQgU+JSWdJT2fI0yWrCM6v2BN/lFffc8wUFxe2yGJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dt27/I3S";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2E606A31E;
	Fri, 27 Nov 2026 17:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dt27/I3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800802; x=1827336802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DRzgdAU5JseGaH7M32Sf0UDnFKqNtKF+8fSsNwxVLjU=;
  b=dt27/I3S5kVBmxKEQxecLhQIpQlXmsafRRK9X02kwKmjVToDFP3yXnEt
   WGB/T2gi587J/6NFBp4TG1fL8jegbpSTN+BSAD9CNPsV4zTPzX/6ocIK5
   yo7v5HRwT/QZWqqzrj+7RAoqNuFFZ+zKLKrqfvYiAFz2v+56LvdvmVeSQ
   l1cJ5K19p8q0qdqDurcA4yuURj8XIf3wESZxjkEO3qHr1WWa53flyQp6q
   REKQGQbsA9JvqhoYkM5Fk26aXu6Vh2v6pZrw7Z6Ad2HCzZw+MRM+mgtRA
   oV3JB+e0zrVog/7vxOQsIjZMr8EE2dDzJOWSMTsQoCjUqaHhmgSqL+YOW
   A==;
X-CSE-ConnectionGUID: aIOqR9UORUma0vJnZcSMng==
X-CSE-MsgGUID: TK0uEL8CThibuDroqIfglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4767301"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4767301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:33:22 -0800
X-CSE-ConnectionGUID: Vn6B3kjYSJmuc/Gx6Zpslw==
X-CSE-MsgGUID: lMB/gzetQ3m4B9zfnmzsWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12429759"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:33:20 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A4C7B11F8C9;
	Fri, 27 Nov 2026 19:33:22 +0200 (EET)
Date: Fri, 27 Nov 2026 19:33:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?C=E9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] media: v4l2-async: link ancillary device runtime PM to
 the sensor's
Message-ID: <awm-4sz5H2NAcXsj@kekkonen.localdomain>
References: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>
 <arNzDkG8JmIWedwF@kekkonen.localdomain>
 <179014670130.2497080.16248724869350735374@ping.linuxembedded.co.uk>
 <arZX1fhR_hvg0nfM@kekkonen.localdomain>
 <7e748fc5-43d1-4200-9ad4-45d43d659e47@adishatz.org>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e748fc5-43d1-4200-9ad4-45d43d659e47@adishatz.org>

Hi Cédric,

On Thu, Nov 26, 2026 at 07:23:32AM +0100, Cédric Bellegarde wrote:
> Hello,
> 
> Le 25/09/2026 à 13:15, Sakari Ailus a écrit :
> > Hi Kieran,
> > 
> > On Wed, Sep 23, 2026 at 07:58:21AM +0100, Kieran Bingham wrote:
> > > Quoting Sakari Ailus (2026-09-23 07:34:54)
> > > > Hi C�dric,
> > > > 
> > > > On Tue, Sep 22, 2026 at 09:39:12PM +0200, C�dric Bellegarde wrote:
> > > > > When a sensor's fwnode references an ancillary lens or flash device
> > > > > (e.g. via the "lens-focus" or "flash-leds" properties),
> > > > > v4l2_async_create_ancillary_links() already creates a media controller
> > > > > link between the two entities, but their runtime PM states remain
> > > > > independent.
> > > > > 
> > > > > This is a problem for devices such as VCM lens actuators, which are
> > > > > typically spring-loaded: holding a position away from the spring's
> > > > > rest point requires continuous power, and the position is not retained
> > > > > once power is cut. If such an actuator is allowed to runtime-suspend
> > > > > independently of the sensor, the lens can drift back to its rest
> > > > > position during an otherwise active capture session.
> > > > > 
> > > > > Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
> > > > > that its runtime PM state be linked to the associated sensor.
> > > > 
> > > > Interesting idea.
> > > > 
> > > > The IPU bridge has created such a device link between the VCM and the
> > > > sensor as on some ACPI systems the VCM is in fact relying on the power
> > > > resources of the sensor. But to do this everywhere?
> > > 
> > > Same on any Raspberry Pi camera module. The VCM is powered by the same
> > > enable lines as the Sensor there I think which has made things
> > > interesting in handling VCMs for those devices.
> > 
> > Yes, this has been an issue in DT for a long time. :-( I'm not sure if this
> > approach could extend into a solution for that though.
> > 
> > > 
> > > 
> > > > VCMs traditionally have been powered through opening their sub-device node
> > > > and that hasn't been exactly neat API-wise. It has been practical still,
> > > > AFAIK, as in order to control the VCM, you have to have a sub-device node
> > > > open.
> > > 
> > > This is an issue though, as libcamera opens the device nodes and holds
> > > the file descriptor when it has a camera. This means that even if the
> > > camera isn't streaming, the VCM is powered on and causes power
> > > consumption on mobile devices which people then attribute to pipewire.
> > 
> > A practical fix for that could be to set the current to 0 when streaming is
> > off.
> 
> For the zero-current route: lens subdevs have no s_stream, so how would the
> VCM driver learn that streaming stopped? The device link gets this from

libcamera would have to do that. I don't see why it couldn't.

-- 
Regards,

Sakari Ailus
